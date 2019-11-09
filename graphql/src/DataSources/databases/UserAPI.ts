import { prisma } from '../../Schema/generated/prisma-client'
const isEmail = require('isemail')
// TODO: Implement object validation
import * as yup from 'yup'
import { DataSource } from 'apollo-datasource'
import { AuthenticationError } from 'apollo-server'

interface UserModel {
  id: string
  firstName: string
  otherName: string
  lastName: string
  email: string
  disabled: boolean
}

const userSchema = yup.object({
  id: yup.string(),
  firstName: yup.string().required(),
  otherName: yup.string(),
  lastName: yup.string().required(),
  email: yup
    .string()
    .email()
    .required(),
  disabled: yup.boolean().default(true),
})

export class UserAPI extends DataSource {
  context

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
  }

  async createUser({
    firstName,
    lastName,
    email,
    otherName,
  }: {
    firstName: string
    lastName: string
    email: string
    otherName?: string
  }) {
    let newUser = <UserModel>{
      firstName: firstName,
      otherName: otherName,
      lastName: lastName,
      email: email,
    }

    try {
      await userSchema.isValid(newUser)

      return await prisma.createUser(newUser)
    } catch (error) {
      throw new Error('Something is wrong')
    }
  }

  async findUserById({ id }: { id: string }) {
    return <UserModel>await prisma.user({ id: id })
    // return user
  }

  async findUserByEmail({ email }: { email: string }) {
    // const email = this.context && this.context.user ? this.context.user.email : emailArg
    // if (!email || !isEmail.validate(email)) return null
    return <UserModel>await prisma.user({ email: email })
  }

  async sessionUser() {
    try {
      if (this.context && this.context.user) return this.context.user
    } catch (error) {
      throw new AuthenticationError('Not authenticated!')
    }
  }
}
