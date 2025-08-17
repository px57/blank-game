# Configuration OpenStreetMap

Ce projet met en place un serveur de dalles OpenStreetMap à l'aide de Docker.

## Démarrage rapide

1.  **Téléchargez un extrait de carte OpenStreetMap** au format `.pbf`. Par exemple, depuis [Geofabrik](http://download.geofabrik.de/).
2.  **Placez le fichier `.pbf`** dans le répertoire `servers/openstreetmap/data`.
3.  **Renommez-le** en `data.osm.pbf`.
4.  **Exécutez Docker Compose :**

    ```bash
    docker-compose up -d
    ```

5.  **Accédez au service** sur `http://localhost:8080`.

## Personnalisation

Le style de la carte et d'autres paramètres peuvent être configurés en modifiant les fichiers dans `servers/openstreetmap`.
