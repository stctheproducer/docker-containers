FROM almir/webhook

RUN  apk --update --upgrade add git

COPY /hooks/hooks.json /etc/webhook/hooks.json

COPY /scripts/webhook-test.example /opt/scripts/webhook-test.sh

RUN chmod +x /opt/scripts/*.sh

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]