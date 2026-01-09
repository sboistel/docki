---
title: Jellyfin
description: The Free Software Media System
---

## Description

[Jellyfin](https://jellyfin.org/) is a free software media system that puts you in control of managing and streaming your media. It is a fork of Emby and MediaPortal, created in response to the decision to make Emby closed source.

![Jellyfin Overview](https://jellyfin.org/assets/images/10.8-home-4a73a92bf90d1eeffa5081201ca9c7bb.png)

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
      - /shared/tunes:/music
      - /shared/movies:/movies
      - /shared/series:/series
```
