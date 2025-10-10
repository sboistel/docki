---
title: Glance
description: A simple and modern dashboard to manage your services
---

## Docker compose

```yml
---
services:
  glance:
    image: glanceapp/glance
    container_name: glance
    env_file: .env
    volumes:
      - /opt/docker/glance/data:/app/config
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 8182:8080
    restart: unless-stopped

networks:
  default:
    external: true
    name: external
```
