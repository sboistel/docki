---
title: Uptime Kuma
description: A self-hosted monitoring tool like "Uptime Robot"
---

## Docker compose

```yml
---
services:
  uptime-kuma:
    container_name: kuma
    image: louislam/uptime-kuma:latest
    restart: unless-stopped
      #    ports:
      #      - 3001:3001
    volumes:
      - ./data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations

networks:
  default:
    external: true
    name: external
```
