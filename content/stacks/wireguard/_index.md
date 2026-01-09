---
title: WireGuard
description: A fast, modern, and secure VPN tunnel
---

## Description

[WireGuard](https://www.wireguard.com/) is a fast, modern, and secure VPN tunnel that utilizes state-of-the-art cryptography. It aims to be simpler, faster, and more secure than traditional VPN protocols.

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
```

## Environment Variables

```env
PUID=0
PGID=0
TZ=Europe/Paris
SERVERURL=<your dns>
SERVERPORT=51820
PEERS=6 # number of clients
PEERDNS=auto # or custom dns like 1.1.1.1
INTERNAL_SUBNET=<internal subnet>
ALLOWEDIPS=0.0.0.0/0
```
