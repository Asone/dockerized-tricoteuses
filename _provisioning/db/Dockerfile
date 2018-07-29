
FROM postgres:9.6-alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-db
LABEL VERSION=1

RUN apk update && apk upgrade && \
    apk add --no-cache git wget


ADD ./_dumps _dumps/
#WORKDIR _dumps
#RUN wget http://data.senat.fr/data/ameli/ameli.zip  && \
#unzip ameli.zip && \
#mv var/opt/opendata/ameli.sql /_dumps/ 

# dropdb ameli
# dropuser opendata
# createuser -IPRS opendata
#   Enter password for new role: opendata
#   Enter it again: opendata
# createdb -E utf-8 -O opendata ameli
#RUN ls
#RUN psql ameli < ./_dumps/ameli.sql 
#RUN exit 
# RUN rm ameli.zip
