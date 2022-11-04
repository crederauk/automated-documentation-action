FROM golang:1.18.3-alpine

RUN apk add unzip
RUN apk add git

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]