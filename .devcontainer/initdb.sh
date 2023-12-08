#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    create user milk with password 'milk';
    
    create database milk_test;
    grant all privileges on database milk_test to milk;
    \c milk_test postgres
    grant all on schema public to milk;

    create database milk_development;
    grant all privileges on database milk_development to milk;
    \c milk_development postgres
    grant all on schema public to milk;
EOSQL