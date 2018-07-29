#!/bin/bash
set -e

dropdb -U user ameli 
createdb -U user -E utf-8 ameli

cd /_dumps
wget http://data.senat.fr/data/ameli/ameli.zip -O ameli.zip && \
unzip -o ameli.zip && \
psql -U user ameli < var/opt/opendata/ameli.sql 