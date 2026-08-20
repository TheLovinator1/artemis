#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Create Users
    CREATE USER sonarr WITH PASSWORD '$POSTGRES_SONARR_PASSWORD';
    CREATE USER radarr WITH PASSWORD '$POSTGRES_RADARR_PASSWORD';
    CREATE USER prowlarr with PASSWORD '$POSTGRES_RADARR_PASSWORD';

    -- Create Backup User (Global Read-Only access)
    CREATE USER backup WITH PASSWORD '$POSTGRES_BACKUP_PASSWORD';
    GRANT pg_read_all_data TO backup;

    -- Create Sonarr Databases
    CREATE DATABASE sonarr_default_main OWNER sonarr;
    CREATE DATABASE sonarr_default_log OWNER sonarr;
    CREATE DATABASE sonarr_anime_main OWNER sonarr;
    CREATE DATABASE sonarr_anime_log OWNER sonarr;

    -- Create Radarr Databases
    CREATE DATABASE radarr_default_main OWNER radarr;
    CREATE DATABASE radarr_default_log OWNER radarr;
    CREATE DATABASE radarr_anime_main OWNER radarr;
    CREATE DATABASE radarr_anime_log OWNER radarr;

    -- Create Prowlarr Databases
    CREATE DATABASE prowlarr_main OWNER prowlarr;
    CREATE DATABASE prowlarr_log OWNER prowlarr;
EOSQL