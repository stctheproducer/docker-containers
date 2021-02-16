ARG WEBHOOK_VERSION=2.8.0

FROM almir/webhook:${WEBHOOK_VERSION}

RUN  apk --update --upgrade add git bash jq openssh docker docker-compose

# Add user
RUN addgroup -S webhook && adduser -D -u 1000 -s /bin/bash -G webhook -G docker webhook

# Change ownership of opt
RUN chown webhook:webhook -R /opt

COPY ./hooks/hooks.yml /etc/webhook/hooks.yml

# Change current user to webhook
USER webhook

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yml", "-hotreload", "-template"]