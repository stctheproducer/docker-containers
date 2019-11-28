const jwt = require('jsonwebtoken')

function isAuthenticated(resolve, obj, args, ctx, info) {
  if (!ctx.user) {
    throw new Error('You need to be logged in for this!')
  }
  return resolve(obj, args, ctx, info)
}

module.exports = {
  Query: {
    me: isAuthenticated,
  },
  Mutation: {
    createUser: isAuthenticated,
  },
}
