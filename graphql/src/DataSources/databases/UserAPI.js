const { DataSource } = require('apollo-datasource')
const { AuthenticationError } = require('apollo-server')
// TODO: Implement object validation
const yup = require('yup')
// const { prisma } = require('../../Schema/generated/prisma-client')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const { APP_SECRET, BCRYPT_SALT_ROUNDS } = require('../../utils')

const userSchema = yup.object({
  id: yup.string(),
  firstName: yup.string().required(),
  otherName: yup.string(),
  lastName: yup.string().required(),
  email: yup
    .string()
    .email()
    .required(),
  password: yup.string().required(),
  disabled: yup.boolean().default(true),
})

class UserAPI extends DataSource {
  context
  prisma

  constructor() {
    super()
  }

  /**
   * This is a function that gets called by ApolloServer when being setup.
   * This function gets called with the datasource config including things
   * like caches and context. We'll assign this.context to the request context
   * here, so we can know about the user making requests
   */
  initialize(config) {
    this.context = config.context
    this.prisma = this.context.prisma
  }

  async authenticateUser(email, password) {
    // Get the the user
    const user = await this.findUserByEmail(email)
    if (!user) {
      throw new Error('User does not exist!')
    }

    // Check if the password macthes
    const passwordMatch = await bcrypt.compare(password, user.password)
    if (!passwordMatch) {
      throw new AuthenticationError('Invalid login details!')
    }

    const token = jwt.sign(
      {
        id: user.id,
        username: user.email,
      },
      APP_SECRET,
      {
        expiresIn: '1h',
      },
    )

    return {
      user,
      token,
    }
  }

  async createUser({ firstName, lastName, email, otherName, password }) {
    try {
      let newUser = {
        firstName: firstName,
        otherName: otherName,
        lastName: lastName,
        email: email,
        password: await bcrypt.hash(password, BCRYPT_SALT_ROUNDS),
      }

      const valid = await userSchema.isValid(newUser)

      if (!valid) throw new Error('Invalid data entered!')

      return await this.prisma.createUser(newUser)
    } catch (error) {
      throw new Error(error.message)
    }
  }

  async findUserById(id) {
    return await this.prisma.user({ id: id })
  }

  async findUserByEmail(email) {
    try {
      const userExists = await this.prisma.$exists.user({ email: email })

      if (userExists) {
        return await this.prisma.user({ email: email })
        // return 'User exists!'
      }
    } catch (e) {
      throw new Error(`User with the email address "${email}" doesn't exist!`)
    }
  }

  async sessionUser() {
    try {
      const user = this.findUserById(this.context.user.id)
      return user
    } catch (error) {
      throw new AuthenticationError('Not authenticated!')
    }
  }
}

module.exports = UserAPI
