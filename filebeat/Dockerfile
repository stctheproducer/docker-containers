ARG FILEBEAT_VERSION=7.10.2

FROM docker.elastic.co/beats/filebeat:${FILEBEAT_VERSION}

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

USER root

RUN mkdir -p /var/lib/filebeat

RUN chown filebeat:filebeat /var/lib/filebeat

RUN curl https://raw.githubusercontent.com/logzio/public-certificates/master/AAACertificateServices.crt --create-dirs -o /etc/pki/tls/certs/COMODORSADomainValidationSecureServerCA.crt

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

USER filebeat
