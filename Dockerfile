FROM golang:1.18.3-alpine

RUN apk add unzip
RUN apk add git
RUN apk add --update npm

COPY tools/ /tools/
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]