const { makeExecutableSchema } = require('apollo-server')
const { applyMiddleware } = require('graphql-middleware')
const { merge } = require('lodash')

const { importSchema } = require('graphql-import')
const { Query, Mutation } = require('./Fetchers')

const { isAuthenticated } = require('./Middleware')

const typeDefs = importSchema('src/Schema/index.graphql')
const resolvers = merge(Query, Mutation)
const schema = makeExecutableSchema({ typeDefs, resolvers })
const schemaWithMiddleware = applyMiddleware(schema, isAuthenticated)

// module.exports = { typeDefs, resolvers, schema }
module.exports = schemaWithMiddleware
