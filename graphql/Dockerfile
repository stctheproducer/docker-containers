FROM node:lts-alpine
# :8-alpine

# Install type script globally
# RUN npm i -g nodemon

# Create app directory
WORKDIR /usr/api

# set app directoy ownership to user node of group node
RUN chown -R node:node /usr/api

# change user
USER node

# Install app dependencies
COPY ./package.json ./

# RUN  yarn install --production
RUN  yarn install --prod --force --emoji true

# build time argument to add tools for development
ARG NODE_ENV

# root level operations start here
USER root

# global install needs root privileges. Only installed during development
RUN if [ "$NODE_ENV" = "development" ] ; then npm install -g nodemon ; fi

# change user
USER node

# Change ownership during copy
COPY --chown=node:node ./src ./src

EXPOSE 4000
CMD [ "yarn", "dev" ]