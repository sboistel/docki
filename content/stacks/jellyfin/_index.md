---
title: Jellyfin
description: The Free Software Media System
---

## Docker compose

```yml
---
services:
  jellyfin:
    image: jellyfin/jellyfin
    container_name: jellyfin
    restart: unless-stopped

    ports:
      - 8096:8096

    volumes:
      - ./data/config:/config
      - ./data/cache:/cache
      # - ./data/media:/media
      - /opt/docker/ncloud/data/sboistel/files/Records:/records
      # - /opt/docker/ncloud/data/sboistel/files/Music/:/music
      - /shared/tunes:/music
      - /shared/movies:/movies
      - /shared/series:/series

networks:
  default:
    external: true
    name: external
```
