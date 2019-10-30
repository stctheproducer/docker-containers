FROM almir/webhook

RUN  apk --update --upgrade add git

COPY /hooks/hooks.json.example /etc/webhook/hooks.json

COPY /scripts/deploy.sh /opt/scripts/

RUN chmod +x /opt/scripts/deploy.sh

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]