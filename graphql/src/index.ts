import { ApolloServer } from 'apollo-server'

import { schema, typeDefs, resolvers } from './schema'
// Data sources
import { UserAPI, JSONPlaceholderAPI } from './DataSources'

const server = new ApolloServer({
  schema,
  dataSources: () => ({
    jsonAPI: new JSONPlaceholderAPI(),
    userAPI: new UserAPI(),
  }),
  // context: ({ req }) => ({
  // request: req,
  // prisma
  // }),
  tracing: true,
  playground: process.env.NODE_ENV === 'development',
  debug: process.env.NODE_ENV === 'development',
})

server
  .listen({
    cors: {
      credentials: true,
      origin: '*',
    },
    //[process.env.FRONTEND_URL, process.env.BACKED_URL, process.env.PLAYGROUND_URL]
    // },
  })
  .then(({ url }) => {
    console.log(`\u{1F680} Server is running on ${url}`)
  })
