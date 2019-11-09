export default {
  Query: {
    postAuthor: (_: any, { id }: { id: number }, { dataSources }: any) => dataSources.jsonAPI.getPostAuthorById(id),
  },
}
