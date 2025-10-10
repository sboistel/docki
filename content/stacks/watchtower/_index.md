---
title: Watchtower
description: A process for automating Docker container base image updates
---

## Docker compose

```yml
---
services:
  # https://containrrr.dev/watchtower/
  watchtower:
    env_file: .env
    image: containrrr/watchtower
    restart: unless-stopped
    container_name: watchtower
    # ports:
    #   - "3443:3443"
    #   - "3080:3080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /etc/localtime:/etc/localtime:ro
```
