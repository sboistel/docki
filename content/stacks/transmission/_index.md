---
title: Transmission
description: A fast, easy, and free BitTorrent client
---

## Docker compose

```yml
---
services:
    transmission:
      image: linuxserver/transmission
      container_name: transmission
      environment:
        - PUID=0
        - PGID=0
        - TZ=Europe/Paris
      volumes:
        - ./transmission/data/config:/config
        - ./transmission/data/watch:/watch
        - /dl:/downloads
      ports:
        - 9091:9091
        - 51413:51413
        #- 51413:51413/udp
      restart: unless-stopped
```
