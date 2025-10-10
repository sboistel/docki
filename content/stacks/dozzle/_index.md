---
title: Dozzle
description: Dozzle is a lightweight log viewer for Docker containers. It provides a simple web interface to view and search through container logs in real-time.
---

## Docker Compose

```yml
---
services:
  dozzle:
    container_name: dozzle
    restart: unless-stopped
    image: amir20/dozzle:latest
      #    ports:
      #      - 9135:8080
    env_file:
      - .env
    environment:
      - DOZZLE_HOSTNAME=${DOMAIN}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock

networks:
  default:
    external: true
    name: external
```
