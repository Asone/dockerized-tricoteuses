#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE opendata WITH LOGIN PASSWORD 'ameli';
    ALTER ROLE opendata CREATEDB;
    CREATE DATABASE ameli OWNER opendata ENCODING 'UTF8';
EOSQL
