ARG MONGO_VERSION=4.2.1
FROM mongo:${MONGO_VERSION}

COPY mongod.conf /etc/mongo/mongod.conf

VOLUME /data/db /data/configdb

CMD ["mongod"]

EXPOSE 27017