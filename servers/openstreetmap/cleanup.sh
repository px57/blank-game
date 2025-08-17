#!/bin/bash
set -e

# Se connecter à la base de données PostGIS et supprimer les données indésirables
psql -d gis -c "
-- Suppression des routes et chemins
DELETE FROM planet_osm_line WHERE highway IS NOT NULL;
DELETE FROM planet_osm_polygon WHERE highway IS NOT NULL;
DELETE FROM planet_osm_roads WHERE highway IS NOT NULL;

-- Suppression des bâtiments
DELETE FROM planet_osm_polygon WHERE building IS NOT NULL;

-- Suppression des zones résidentielles et autres constructions
DELETE FROM planet_osm_polygon WHERE landuse IN ('residential', 'commercial', 'industrial', 'retail');

-- Suppression des barrières
DELETE FROM planet_osm_line WHERE barrier IS NOT NULL;

-- Suppression des lignes électriques
DELETE FROM planet_osm_line WHERE power IN ('line', 'minor_line');
"

echo "Nettoyage de la carte terminé."
