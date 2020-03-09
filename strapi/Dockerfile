FROM node:lts-alpine

WORKDIR /usr/api

RUN chown -R node:node /usr/api

RUN apk add --no-cache build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm

USER node

COPY --chown=node:node ./package.json .

RUN yarn

COPY --chown=node:node . .

EXPOSE 1337

CMD ["yarn", "develop"]
