import jwt from 'jsonwebtoken'
import { APP_SECRET } from '../utils'

function isAuthenticated(resolve, obj, args, ctx, info) {
  console.log('CTX: ', ctx)
  const Authorization = ctx.request.get('Authorization')
  if (Authorization) {
    const token = Authorization.replace('Bearer ', '')
    const session = jwt.verify(token, APP_SECRET)
    return resolve(obj, args, { ...ctx, session }, info)
  }
  throw new Error('Authentication required!')
}

export default {
  Query: {
    sessionUser: isAuthenticated,
  },
  Mutation: {
    createUser: isAuthenticated,
    updateUser: isAuthenticated,
  },
}
