import { makeExecutableSchema } from 'apollo-server'
import { applyMiddleware } from 'graphql-middleware'
import { merge } from 'lodash'

import { importSchema } from 'graphql-import'
export const typeDefs = importSchema('src/Schema/index.graphql')
import { Query, Mutation } from './Fetchers'
export const resolvers = merge(Query, Mutation)

// import isAuthenticated from './Middleware/isAuthenticated'
// import * as middlewares from './Middleware'

export const schema = makeExecutableSchema({ typeDefs, resolvers })
// const schemaWithMiddleware = applyMiddleware(schema, isAuthenticated)

// export default schemaWithMiddleware
