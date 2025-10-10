---
title: Navidrome
description: A self-hosted music server and streamer
---

## Docker compose

```yml
---
services:
  navidrome:
    image: deluan/navidrome:latest
    container_name: navidrome
      #    ports:
      #      - "4533:4533"
    restart: unless-stopped
    env_file: .env
    volumes:
      - "./data:/data"

networks:
  default:
    external: true
    name: external
```
