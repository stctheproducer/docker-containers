const { paginateResults } = require('../../utils')

module.exports = {
  Query: {
    posts: async (_, { pageSize = 10, after }, ctx) => {
      const allPosts = await ctx.dataSources.jsonAPI.getAllPosts()

      // Paginate posts
      const posts = paginateResults({
        after,
        pageSize,
        results: allPosts,
      })

      return {
        posts,
        cursor: posts.length ? posts[posts.length - 1].cursor : null,
        // if the cursor of the end of the paginated results is the same as the
        // last item in _all_ results, then there are no more results after this
        hasMore: posts.length ? posts[posts.length - 1].cursor !== allPosts[allPosts.length - 1].cursor : false,
      }
    },
    post: async (_, { id }, ctx) => await ctx.dataSources.jsonAPI.getPostById(id),
    postsIds: async (_, { ids }, ctx) => await ctx.dataSources.jsonAPI.getPostsByIds(ids),
  },
}
