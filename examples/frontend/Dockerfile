FROM node:lts-alpine as build-stage

# install simple http server for serving static content
# RUN npm install -g http-server

# make the '/usr/app' folder the current working directory
WORKDIR /usr/app

# Change ownership of work directory for good measure
RUN chown -R node:node /usr/app

# install several dependencies
# RUN apk add --no-cache build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm

# switch to non-root user
USER node

# copy 'package.json'
COPY --chown=node:node ./package.json ./

# install project dependencies
RUN yarn

COPY --chown=node:node . .

# build app for production with minification
RUN yarn build

# EXPOSE 8080

# CMD ["http-server", "dist"]

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /usr/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
