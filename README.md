# Artemis

My home server

## Requirements

```bash
# Install docker
paru -S docker docker-compose

# Create the directory on the host
sudo mkdir -p /opt/dockhand
sudo chown 1000:1000 /opt/dockhand

# Create 32-byte (256-bit) random key for Dockhand and add it to .env file
openssl rand -base64 32

# Create .env file
cp .env.example .env
```

## Usage

```bash
# Start the containers
docker compose up -d

# Stop the containers
docker compose down
```

## Access

```bash
# Open the dashboard in your browser
http://localhost:3000

# Go to Settings > Environments:
# - Add a new environment or edit the default one
# - Set connection type to Direct
# - Set the host to socket_proxy:2375
# - Save the environment

```

## Directories

```bash
# Databasus - For backing up the database
/mnt/Docker/Data/Media/Databasus
/mnt/fourteen/Data/Backup/Media/Databasus

# Postgres - The actual database
/mnt/Docker/Data/Media/Postgres

# Prowlarr - Torrent indexer for Sonarr, Radarr and and other clients
/mnt/Docker/Data/Media/Prowlarr

# Radarr - Movie downloader
/mnt/Docker/Data/Media/Radarr/Anime
/mnt/Docker/Data/Media/Radarr/Default

# Recyclarr - Automatically synchronize TRaSH Guides to Sonarr and Radarr
/mnt/Docker/Data/Media/Recyclarr

# Sonarr - TV show downloader
/mnt/Docker/Data/Media/Sonarr/Anime
/mnt/Docker/Data/Media/Sonarr/Default

# Torrents directory
/mnt/fourteen/Data/Torrents

mkdir -p \
  /mnt/Docker/Data/Media/Sonarr/{Default,Anime} \
  /mnt/Docker/Data/Media/Radarr/{Default,Anime} \
  /mnt/Docker/Data/Media/Recyclarr \
  /mnt/Docker/Data/Media/Prowlarr \
  /mnt/Docker/Data/Media/Postgres \
  /mnt/Docker/Data/Media/Databasus \
  /mnt/fourteen/Data/Torrents \
  /mnt/fourteen/Data/Backup/Media/Databasus
```

## Ports

| Service      |   Port |
| ------------ | -----: |
| Sonarr       | `8989` |
| Sonarr Anime | `8990` |
| Radarr       | `7878` |
| Radarr Anime | `7879` |
| Prowlarr     | `9696` |
| Databasus    | `4005` |
