#Install and configure [] 

FROM project42/nginx-shiboleth
MAINTAINER Brandon Cone bcone@esu10.org


ENV KOPF_VERSION 2.1.2
ENV ES_LS_KB_VERSION 5.6.4

RUN apk update && \
apk add apache2-utils curl && \
curl -s -L https://github.com/lmenezes/elasticsearch-kopf/archive/v${KOPF_VERSION}.zip --output /tmp/kopf-${KOPF_VERSION}.zip && \
mkdir -p /webroot && \
unzip /tmp/kopf-${KOPF_VERSION}.zip -d /tmp && echo "/tmp has: " && ls /tmp && mv "/tmp/elasticsearch-kopf-${KOPF_VERSION}" /webroot/kopf

COPY container_files /