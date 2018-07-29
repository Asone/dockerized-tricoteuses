FROM node:alpine

LABEL AUTHOR="Nelson Herbin <nelson@herbin.info>"
LABEL NAME=tricoteuses-db
LABEL VERSION=1

RUN "wget http://data.senat.fr/data/ameli/ameli.zip \
unzip ameli.zip \
su \
su postgres \
# dropdb ameli
# dropuser opendata
# createuser -IPRS opendata
#   Enter password for new role: opendata
#   Enter it again: opendata
# createdb -E utf-8 -O opendata ameli
psql ameli < var/opt/opendata/ameli.sql \
exit \
rm -R var/ \ 
rm ameli.zip"
