---
title: "Arcane"
description: "Modern Docker Management, Designed for Everyone."
---

## Description

Arcane is a modern, open-source Docker management tool that provides a user-friendly interface for managing your Docker containers, images, networks, and volumes. It is designed to be easy to use for both beginners and experienced Docker users.

<div align="center">
  <img width="700" alt="Arcane Dashboard" src="https://raw.githubusercontent.com/getarcaneapp/arcane/refs/heads/main/.github/assets/arcane-dashboard.png" />
</div>

## Docker Compose

You can use the generator [getarcane.app/generator](https://getarcane.app/generator) to create a custom Docker Compose file for Arcane, or use the following example:

```yml
---
services:
  arcane:
    image: ghcr.io/getarcaneapp/arcane:latest
    container_name: arcane
    restart: unless-stopped
    ports:
      - 3552:3552
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
      - /opt/docker:/app/data/projects
    env_file: .env
```

## Environment Variables

```env
APP_URL=http://192.168.X.X:3552

# PUID=1000
# PGID=1000

# docker run --rm ghcr.io/getarcaneapp/arcane:latest /app/arcane generate secret
ENCRYPTION_KEY=...
JWT_SECRET=...

LOG_LEVEL=info
LOG_JSON=false

OIDC_ENABLED=false

DATABASE_URL=file:data/arcane.db?_pragma=journal_mode(WAL)&_pragma=busy_timeout(2500)&_txlock=immediate
```
