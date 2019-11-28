module.exports = {
  Mutation: {
    login: async (_, { email, password }, { dataSources }) => {
      const user = await dataSources.userAPI.authenticateUser(email, password)
      return user
    },
    createUser: async (_, { firstName, lastName, email, otherName, password }, { dataSources }) => {
      const user = await dataSources.userAPI.createUser({
        firstName,
        lastName,
        email,
        otherName,
        password,
      })
      return user
    },
  },
}
