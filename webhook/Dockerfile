ARG WEBHOOK_VERSION=2.8.0

FROM almir/webhook:${WEBHOOK_VERSION}

# RUN  apk --update --upgrade add git bash jq openssh
RUN  apk --update --upgrade add git bash jq openssh docker docker-compose

COPY ./hooks/hooks.yml /etc/webhook/hooks.yml

RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yml", "-hotreload", "-template"]