ARG WEBHOOK_VERSION=2.8.0

FROM almir/webhook:${WEBHOOK_VERSION}

RUN  apk --update --upgrade add git bash jq

COPY ./hooks/hooks.yml /etc/webhook/hooks.yml

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yml", "-hotreload", "-template"]