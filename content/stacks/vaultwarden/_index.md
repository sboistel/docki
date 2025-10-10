---
title: Vaultwarden
description: A self-hosted password manager
---

## Docker compose

```yml
---
services:
  vaultwarden:
    image: vaultwarden/server:latest
    container_name: vaultwarden
    restart: unless-stopped
    volumes:
      - /opt/docker/vaultwarden/data:/data/
    # ports:
    #   - 3012:3012
    #   - 8080:80
    env_file: .env

networks:
  default:
    external: true
    name: external
```
