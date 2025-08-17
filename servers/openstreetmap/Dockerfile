# Dockerfile — image de rendu OSM (mod_tile + renderd + Mapnik)
FROM overv/openstreetmap-tile-server:latest

# Threads de rendu (ajuste selon ta machine)
ENV THREADS=4
# Niveau de zoom maxi généré à la volée (tu peux limiter à 14–16 si besoin)
ENV MAX_ZOOM=19

# Copie des scripts de préparation et de nettoyage
COPY prepare.sh /usr/local/bin/prepare.sh
RUN chmod +x /usr/local/bin/prepare.sh
COPY cleanup.sh /usr/local/bin/cleanup.sh
RUN chmod +x /usr/local/bin/cleanup.sh

# Création du script d'exécution run.sh
RUN echo '#!/bin/bash' > /usr/local/bin/run.sh && \
    echo 'set -e' >> /usr/local/bin/run.sh && \
    echo '' >> /usr/local/bin/run.sh && \
    echo '# Piège le signal de sortie pour exécuter le nettoyage' >> /usr/local/bin/run.sh && \
    echo 'trap "/usr/local/bin/cleanup.sh" EXIT' >> /usr/local/bin/run.sh && \
    echo '' >> /usr/local/bin/run.sh && \
    echo '# Exécute le script de préparation' >> /usr/local/bin/run.sh && \
    echo '/usr/local/bin/prepare.sh' >> /usr/local/bin/run.sh && \
    echo '' >> /usr/local/bin/run.sh && \
    echo '# Démarrer renderd en arrière-plan' >> /usr/local/bin/run.sh && \
    echo 'renderd -f -c /usr/local/etc/renderd.conf &' >> /usr/local/bin/run.sh && \
    echo '' >> /usr/local/bin/run.sh && \
    echo '# Démarrer Apache en avant-plan' >> /usr/local/bin/run.sh && \
    echo 'exec /usr/sbin/apache2ctl -D FOREGROUND' >> /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh
