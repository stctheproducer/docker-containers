ARG MARIADB_VERSION=latest
FROM mariadb:${MARIADB_VERSION}

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

# Copy SSL certificates
# COPY /certs/mariadb.dev.test.pem /etc/mysql/ssl/mariadb.dev.test.pem
# COPY /certs/mariadb.dev.test-key.pem /etc/mysql/ssl/mariadb.dev.test-key.pem
# COPY /certs/rootCA.pem /etc/mysql/ssl/rootCA.pem

# RUN chown -R mysql:root /etc/mysql/ssl/

COPY my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
