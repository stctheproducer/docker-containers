export default {
  Query: {
    user: (_, { id }, { dataSources }) => dataSources.userAPI.findUserById(id),
    userEmail: (_, { email }, { dataSources }) => dataSources.userAPI.findUserByEmail(email),
    me: (_, __, { dataSources }) => dataSources.userAPI.sessionUser,
  },
}
