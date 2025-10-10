---
title: Homepage
description: A fast, modular, and privacy-focused dashboard for your server
---

## Docker compose

```yml
---
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: homepage
    env_file: .env
    restart: unless-stopped
      #    ports:
      #      - 3000:3000
    volumes:
      - ./data/app:/app/config
      - ./data/resources:/app/public/icons
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations
      
networks:
  default:
    external: true
    name: external
```
