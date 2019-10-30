FROM almir/webhook

RUN  apk --update --upgrade add git bash

COPY /hooks/hooks.json /etc/webhook/hooks.json

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]