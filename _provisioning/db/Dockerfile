
FROM postgres:9.6-alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-db
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git wget


ADD ./_dumps _dumps/

