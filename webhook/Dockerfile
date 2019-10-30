FROM almir/webhook

COPY /hooks/hooks.json.example /etc/webhook/hooks.json

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]