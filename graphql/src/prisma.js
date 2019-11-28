require('dotenv').config()

const { Prisma } = require('./Schema/generated/prisma-client')

module.exports = {
  prisma: new Prisma({
    endpoint: process.env.PRISMA_ENDPOINT,
    secret: process.env.PRISMA_SECRET,
    debug: true,
  }),
}
