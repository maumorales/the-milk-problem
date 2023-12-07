#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    create database milk_test;
    create database milk_development;
    create user milk with password 'milk';
    grant all privileges on database milk_test to milk;
    grant all privileges on database milk_development to milk;
EOSQL