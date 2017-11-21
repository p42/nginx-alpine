#Install and configure [] 

FROM nginx:alpine
MAINTAINER Brandon Cone bcone@esu10.org

COPY container_files /

RUN apk update && \
apk add apache2-utils