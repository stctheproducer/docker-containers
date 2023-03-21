ARG PGID=1000
ARG PUID=1000

FROM golang:1.20.2-alpine3.17

ENV GOPATH /go
ENV SRCPATH /root/webhook
ENV GITPATH https://github.com/adnanh/webhook

RUN addgroup -g 1000 -S webhook
RUN adduser -u 1000 -S webhook -G webhook

RUN apk add --update -t build-deps git libc-dev gcc libgcc && \
    git clone ${GITPATH} ${SRCPATH} && \
    cd ${SRCPATH} && go get -d && go build -o /usr/local/bin/webhook && \
    apk del --purge build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf ${GOPATH} /usr/local/go && \
    cd /root && rm -rf ${SRCPATH}

RUN apk add git bash jq openssh docker docker-cli-compose curl 

# RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

COPY ./hooks/hooks.json /etc/webhook/hooks.json

RUN chown -R webhook:webhook /etc/webhook

USER webhook

WORKDIR /etc/webhook

EXPOSE      9000
ENTRYPOINT  ["/usr/local/bin/webhook"]
CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload", "-template"]