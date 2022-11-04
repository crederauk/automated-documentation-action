FROM im2nguyen/rover

RUN apk add unzip
RUN apk add git

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]