require('dotenv').config()

const APP_SECRET = process.env.APP_SECRET
const BCRYPT_SALT_ROUNDS = Number(process.env.BCRYPT_SALT_ROUNDS)

function getUserId(context) {
  try {
    return context.session.user.id
  } catch (error) {
    throw new Error(`Cannot retreive user id if there is no session`)
  }
}

export { APP_SECRET, BCRYPT_SALT_ROUNDS, getUserId }
