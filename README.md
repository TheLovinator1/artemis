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
