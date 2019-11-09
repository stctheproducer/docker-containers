import { RESTDataSource } from 'apollo-datasource-rest'

interface AuthorModel {
  id: number
  name: string
  username: string
  email: string
}

interface PostModel {
  userId: number
  id: number
  title: string
  body: string
}

export class JSONPlaceholderAPI extends RESTDataSource {
  constructor() {
    super()
    this.baseURL = `https://jsonplaceholder.typicode.com/`
  }

  async getAllPosts() {
    const response = <PostModel>await this.get('posts')
    return Array.isArray(response) ? response.map(post => this.postReducer(post)) : []
  }

  async getPostAuthorById({ userId }) {
    const response = <AuthorModel>await this.get('users', { id: userId })
    return this.authorReducer(response[0])
  }

  async getPostById({ postId }) {
    const response = <PostModel>await this.get('posts', { id: postId })
    return this.postReducer(response[0])
  }

  async getPostsByIds({ postIds }) {
    return Promise.all(postIds.map((postId: number) => this.getPostById({ postId })))
  }

  postReducer(post: PostModel) {
    return {
      userId: post.userId,
      id: post.id,
      title: post.title,
      body: post.body,
    }
  }

  authorReducer(author: AuthorModel) {
    return {
      id: author.id,
      name: author.name,
      username: author.username,
      email: author.email,
    }
  }
}
