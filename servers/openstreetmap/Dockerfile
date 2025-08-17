# Dockerfile — image de rendu OSM (mod_tile + renderd + Mapnik)
FROM overv/openstreetmap-tile-server:latest

# Threads de rendu (ajuste selon ta machine)
ENV THREADS=4
# Niveau de zoom maxi généré à la volée (tu peux limiter à 14–16 si besoin)
ENV MAX_ZOOM=19

# Copie et exécution du script de nettoyage
COPY cleanup.sh /usr/local/bin/cleanup.sh
RUN chmod +x /usr/local/bin/cleanup.sh

# Ajout du script de nettoyage à l'exécution
RUN echo "/usr/local/bin/cleanup.sh" >> /usr/local/bin/run.sh

