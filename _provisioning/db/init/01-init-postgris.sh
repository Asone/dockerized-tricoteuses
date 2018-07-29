#!/usr/bin/env bash
set -e

ls

#psql -v ON_ERROR_STOP=1  -d ameli --username "$POSTGRES_USER" <<-EOSQL
#    CREATE EXTENSION IF NOT EXISTS "postgis";
#    CREATE EXTENSION IF NOT EXISTS "unaccent";
#EOSQL
