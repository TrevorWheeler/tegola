#!/bin/bash

# Update package list and install required tools
apt-get update && apt-get install -y osm2pgsql

# Wait for the database to be ready
sleep 3

# Enable hstore extension in the database
psql -h postgis -p 5432 -U postgres -d australia -c "CREATE EXTENSION IF NOT EXISTS hstore;"

# Import the OSM data into the database
osm2pgsql --create --database australia --username postgres --host postgis \
  --port 5432 --slim --hstore \
  --cache 2000 --number-processes 4 \
  /data/australia-latest.osm.pbf

# Run the SQL script to create indexes
psql -h postgis -p 5432 -U postgres -d australia -f /data/sql/add_index.sql
# Clean up (if necessary)
# rm -f /data/australia-latest.osm.pbf