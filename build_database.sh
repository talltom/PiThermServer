#!/bin/bash
#
# build_database.sh - create empty temperature database schema for to log temperature in.
#
# Tom Holderness 22/01/2012


echo "Creating sensor_records table"
sqlite3 piTemps.db 'DROP TABLE sensor_records;'
sqlite3 piTemps.db 'CREATE TABLE sensor_records(sensor_id integer primary key, name varchar, celsius_accuracy real);'
echo "Adding config for one local sensor and two remote sensors"
sqlite3 piTemps.db 'INSERT INTO sensor_records(sensor_id, name, celsius_accuracy) VALUES (0, "Local sensor 0 - DS18B20", 0.5);'
sqlite3 piTemps.db 'INSERT INTO sensor_records(sensor_id, name, celsius_accuracy) VALUES (1, "Remote sensor 1", 0.1);'
sqlite3 piTemps.db 'INSERT INTO sensor_records(sensor_id, name, celsius_accuracy) VALUES (2, "Remote sensor 2", 1.5);'

echo "Creating temperature_records table"
sqlite3 piTemps.db 'DROP TABLE temperature_records;'
sqlite3 piTemps.db 'CREATE TABLE temperature_records(id integer primary key autoincrement, sensor_id int, unix_time bigint, celsius real, foreign key(sensor_id) references sensor_records(sensor_id));'
