module.exports = {
  Query: {
    postAuthor: async (_, { id }, context) => await context.dataSources.jsonAPI.getPostAuthorById(id),
  },
}
