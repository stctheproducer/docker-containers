FROM traefik:1.7.5-alpine

LABEL maintainer="Luis Coutinho <luis@luiscoutinho.pt>"

COPY traefik.toml /
COPY ./certs/cert.crt ./certs/cert.key ./certs/cert.includesprivatekey.pem /certs/

RUN chmod 600 /certs/cert.key /certs/cert.includesprivatekey.pem
RUN chmod 644 /certs/cert.crt
