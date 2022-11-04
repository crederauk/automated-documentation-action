FROM im2nguyen/rover

RUN apk add unzip
RUN apk add git

COPY web /
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]