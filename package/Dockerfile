FROM python:2.7.12-alpine

RUN mkdir /usr/src/app

ADD wrapper-pattern.sh /usr/src/app

RUN apk add --update bash \
    && rm -rf /var/cache/apk/*

RUN cd /usr/src/app \
    && chmod +x wrapper-pattern.sh

ENTRYPOINT ["bash", "/usr/src/app/wrapper-pattern.sh"]
