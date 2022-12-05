FROM golang:1.18.3-alpine

RUN apk add unzip
RUN apk add git
RUN apk add --update npm

RUN git clone --depth 1 https://github.com/im2nguyen/rover.git /home/rover

COPY tools/ /tools/
COPY home/rover/ /rover/
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]