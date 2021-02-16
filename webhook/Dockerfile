ARG WEBHOOK_VERSION=2.8.0

FROM almir/webhook:${WEBHOOK_VERSION}

RUN  apk --update --upgrade add git bash jq openssh

# Add user
RUN addgroup -S www && adduser -D -u 1000 -s /bin/bash -G www www

# Change ownership of opt
RUN chown www:www -R /opt

COPY ./hooks/hooks.yml /etc/webhook/hooks.yml

# Change current user to www
USER www

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yml", "-hotreload", "-template"]