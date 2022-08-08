FROM im2nguyen/rover

RUN apk add unzip

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]