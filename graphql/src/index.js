const { ApolloServer } = require('apollo-server')
// Data sources
const { JSONPlaceholderAPI, UserAPI } = require('./DataSources')
// const { typeDefs, resolvers, schema } = require('./schema')
const schema = require('./schema')
const { prisma } = require('./Schema/generated/prisma-client/index')
const { getUser } = require('./utils')

const server = new ApolloServer({
  schema,
  context: async ({ req }) => {
    const tokenWithBearer = req.headers.authorization || ''
    const token = tokenWithBearer.split(' ')[1]
    const user = getUser(token)

    return {
      user,
      request: req,
      prisma,
    }
  },
  dataSources: () => {
    const dataSources = {
      jsonAPI: new JSONPlaceholderAPI(),
      userAPI: new UserAPI(),
    }
    return dataSources
  },
  tracing: process.env.NODE_ENV === 'development' ? true : false,
  playground: process.env.NODE_ENV === 'development',
  debug: process.env.NODE_ENV === 'development',
  introspection: process.env.NODE_ENV === 'development' ? true : false,
})

server.listen().then(({ url }) => {
  console.log(`\u{1F680} Server is running on ${url}`)
})
