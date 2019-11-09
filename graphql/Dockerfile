FROM node:8-alpine

# Create app directory
WORKDIR /usr/api

# set app directoy ownership to user node of group node
RUN chown -R node:node .

# change user
USER node

# Install app dependencies
COPY package.json ./
COPY yarn.lock ./

RUN  yarn install --production

# build time argument to add tools for development
ARG NODE_ENV=production

# root level operations start here
USER root

# global install needs root privileges. Only installed during development
RUN if [ "$NODE_ENV" = "development" ] ; then yarn add -g nodemon ; fi

# COPY always copies files as root. change owner after copy
COPY ./src ./src
RUN chown -R node:node ./src/*

USER node

EXPOSE 4000
CMD [ "yarn", "dev" ]