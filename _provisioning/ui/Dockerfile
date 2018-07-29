FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-ui
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git nodejs npm make g++


CMD ["npm","start"]
EXPOSE 3000