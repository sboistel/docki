---
title: "Loglify"
description: "A self-hosted log management and analysis tool."
---

## Description

Loglify is a self-hosted log management and analysis tool that allows you to collect, store, and analyze logs from various sources. A Lightweight Tool that monitors Docker Container Logs for predefined keywords or regex patterns and sends Notifications.

Github: [github.com/clemcer/loggifly](https://github.com/clemcer/loggifly)

<div align="left">
  <img width="500" alt="Loglify Notification example" src="https://raw.githubusercontent.com/clemcer/LoggiFly/refs/heads/main/docs/public/vault_failed_login.gif" />
</div>

## Docker Compose

```yml
---
services:
  loggifly:
    image: ghcr.io/clemcer/loggifly
    container_name: loggifly
    read_only: true
    environment:
      # Configure Environment Variables here if you don't want to use a config.yaml file
      TZ: Europe/Paris
    env_file: .env # Optional: Load environment variables from a .env file
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./config:/config    # Place your config.yaml file in this directory
    restart: unless-stopped
```

## Environment Variables

```env
# Use ntfy for notifications
NTFY_URL="https://ntfy.<YourDomain>"    
NTFY_TOPIC="loggifly"
NTFY_TOKEN="tk_<YourToken>" # if needed

# List of containers to monitor (comma-separated)
CONTAINERS="ntfy,jellyfin,ncloud_db,nginx-proxy-manager,couchdb,dozzle,beszel,rustdesk-hbbs,rustdesk-hbbr,vaultwarden,wireguard,linkding,frshrss,authelia,kuma,it-tools"

# Global keywords to monitor in logs
GLOBAL_KEYWORDS="error,failed login,password"  # Basic keyword monitoring
GLOBAL_KEYWORDS_WITH_ATTACHMENT="critical"     # Attaches a log file to the notification
```
