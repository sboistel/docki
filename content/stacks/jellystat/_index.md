---
title: "Jellystat"
description: "A self-hosted statistics and analytics tool for Jellyfin media servers."
---

## Description

Jellystat is a self-hosted statistics and analytics tool designed specifically for Jellyfin media servers. It provides detailed insights into your media consumption, server performance, and user activity through an intuitive web interface. *(This project is still in development - expect some weirdness)*

<div align="center">
  <img width="800" alt="Jellystat Dashboard" src="https://raw.githubusercontent.com/CyferShepard/Jellystat/refs/heads/main/screenshots/Home.PNG" />
</div>

## Docker Compose

```yml
services:
  jellystat-db:
    image: postgres:15.2
    shm_size: '1gb'
    container_name: jellystat-db
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-file: "5"
        max-size: "10m"
    env_file: .env
    volumes:
      - ./data/db:/var/lib/postgresql/data
    labels:
      - "wud.watch=false"

  jellystat:
    image: cyfershepard/jellystat:latest
    container_name: jellystat
    restart: unless-stopped
    logging:
      driver: "json-file"
      options:
        max-file: "5"
        max-size: "10m"
    env_file: .env
    volumes:
      - ./data/backup:/app/backend/backup-data
    ports:
      - "3002:3000"
    depends_on:
      - jellystat-db
```

## Environment Variables

```env
POSTGRES_USER=MyPostgresUser
POSTGRES_PASSWORD=MyPostgresPassword

POSTGRES_IP=jellystat-db
POSTGRES_PORT=5432
JWT_SECRET="my-secret-jwt-key"
TZ=mytimezone=Europe/Paris
```

*Make sure to replace the placeholder values in the environment variables with your actual configuration before deploying the stack.*
