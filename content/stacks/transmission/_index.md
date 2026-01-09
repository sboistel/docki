---
title: Transmission
description: A fast, easy, and free BitTorrent client
---

## Description

[Transmission](https://transmissionbt.com/) is a lightweight, open-source BitTorrent client that is known for its simplicity and ease of use. It offers a clean and intuitive interface, making it accessible for both beginners and experienced users. Transmission supports a wide range of features, including encryption, peer exchange, and web seeding, while maintaining a low resource footprint. It is available on multiple platforms, including Windows, macOS, and Linux.

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
        - ./dl:/downloads
      ports:
        - 9091:9091
        - 51413:51413
        #- 51413:51413/udp
      restart: unless-stopped
```
