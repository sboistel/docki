---
title: WireGuard
description: A fast, modern, and secure VPN tunnel
---

## Docker compose

```yml
---
services:
  wireguard:
    image: lscr.io/linuxserver/wireguard:latest
    container_name: wireguard
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_MODULE #optional
    env_file: .env

    volumes:
      - ./data/config:/config
      - ./data/lib/modules:/lib/modules #optional

    ports:
      - 51820:51820/udp

    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1

networks:
  default:
    external: true
    name: external
```
