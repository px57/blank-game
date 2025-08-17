# Dockerfile — image de rendu OSM (mod_tile + renderd + Mapnik)
FROM overv/openstreetmap-tile-server:latest

# Threads de rendu (ajuste selon ta machine)
ENV THREADS=4
# Niveau de zoom maxi généré à la volée (tu peux limiter à 14–16 si besoin)
ENV MAX_ZOOM=19

# Rien d’autre n’est requis : l’image contient osm2pgsql, renderd, Apache, style OSM Carto.
# Le style par défaut sera utilisé (modifiable, voir notes plus bas).

