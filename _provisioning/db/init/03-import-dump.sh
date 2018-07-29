#!/bin/bash
set -e

cd /_dumps
wget http://data.senat.fr/data/ameli/ameli.zip -O ameli.zip && \
unzip ameli.zip && \
ls && \ 
psql ameli < ./var/opt/opendata/ameli.sql
#cd var/opt/opendata \ 
su postgres \
dropdb ameli \
dropuser opendata \
createuser -IPRS opendata \
createdb -E utf-8 -O ameli ameli \
exit \

#psql ameli < ./ameli.sql
#su \
#su postgres \
#ropdb ameli \
#dropuser opendata \
#createuser -IPRS opendata \
#   Enter password for new role: opendata
#   Enter it again: opendata
#createdb -E utf-8 -O ameli ameli \
#psql ameli < /_dumps/ameli.sql \
#exit \
#rm -R var/ \ 
#rm ameli.zip;

#if [ -f /_dumps/ameli.sql ]; then

#fi