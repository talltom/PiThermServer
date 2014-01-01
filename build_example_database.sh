#!/bin/bash
#
# build_example_database.sh - create example temperature database.

DB_FILE=piTemps.db

if [[ -e $DB_FILE ]]; then
    echo "Error: $DB_FILE already exists"
    exit -1
fi

sqlite3 $DB_FILE < example_database.sql
