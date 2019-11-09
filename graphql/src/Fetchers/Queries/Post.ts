export default {
  Query: {
    posts: (_: any, __: any, { dataSources }: any) => dataSources.jsonAPI.getAllPosts(),
    post: (_: any, { id }: { id: number }, { dataSources }: any) => dataSources.jsonAPI.getPostById(id),
    postsIds: (_: any, { ids }: { ids: number[] }, { dataSources }: any) => dataSources.jsonAPI.getPostsByIds(ids),
  },
}
