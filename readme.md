# tegola

An open source vector tile server written in Go, Tegola takes geospatial data and slices it into vector tiles that can be efficiently delivered to any client.

potential help:
https://github.com/dechristopher/tegola-omt

## Usage

Set up a `mvt_postgis` provider with an OSM dump of Australia.

```bash
cd tegola
wget -P ./data/ https://download.geofabrik.de/australia-oceania/australia-latest.osm.pbf
```

```bash
docker compose up
```

### Clean up

```bash
docker compose down -v
```
