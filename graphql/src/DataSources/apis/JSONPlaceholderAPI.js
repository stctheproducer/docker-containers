const { RESTDataSource } = require('apollo-datasource-rest')

class JSONPlaceholderAPI extends RESTDataSource {
  constructor() {
    super()
    this.baseURL = `https://jsonplaceholder.typicode.com/`
  }

  async getAllPosts() {
    const response = await this.get('posts')
    return response
    // return Array.isArray(response) ? response.map(post => this.postReducer(post)) : []
  }

  async getPostAuthorById(userId) {
    const response = await this.get('users', { id: userId })
    return this.authorReducer(response[0])
  }

  async getPostById(postId) {
    const response = await this.get('posts', { id: postId })
    return this.postReducer(response[0])
  }

  async getPostsByIds(postIds) {
    return Promise.all(postIds.map(postId => this.getPostById(postId)))
  }

  postReducer(post) {
    return {
      userId: post.userId,
      id: post.id,
      title: post.title,
      body: post.body,
    }
  }

  authorReducer(author) {
    return {
      id: author.id,
      name: author.name,
      username: author.username,
      email: author.email,
    }
  }
}

module.exports = JSONPlaceholderAPI
