CREATE INDEX geom_index_planet_osm_line ON planet_osm_line USING GIST (way);
CREATE INDEX geom_index_planet_osm_polygon ON planet_osm_polygon USING GIST (way);