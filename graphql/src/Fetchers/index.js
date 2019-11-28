const { merge } = require('lodash')
// Queries
const UserQuery = require('./Queries/User')
const PostQuery = require('./Queries/Post')
const AuthorQuery = require('./Queries/Author')

// Mutations
const UserMutation = require('./Mutations/User')

module.exports = {
  Query: merge(UserQuery, PostQuery, AuthorQuery),
  Mutation: merge(UserMutation),
}
