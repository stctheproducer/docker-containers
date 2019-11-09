import { merge } from 'lodash'
import UserQuery from './Queries/User'
import PostQuery from './Queries/Post'
import AuthorQuery from './Queries/Author'

export const Query = merge(UserQuery, PostQuery, AuthorQuery)

export const Mutation = merge()
