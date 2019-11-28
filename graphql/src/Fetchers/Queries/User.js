module.exports = {
  Query: {
    user: async (_, { id }, context) => await context.dataSources.userAPI.findUserById(id),
    userEmail: async (_, { email }, context) => await context.dataSources.userAPI.findUserByEmail(email),
    me: async (_, __, context) => await context.dataSources.userAPI.sessionUser,
  },
}
