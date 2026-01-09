---
title: "AdGuard Home"
description: "A network-wide software for blocking ads & tracking."
---

## Description

AdGuard Home is a network-wide software for blocking ads & tracking. It operates as a DNS server that filters requests based on predefined rules, providing ad-blocking and privacy protection for all devices connected to the network.

## Docker Compose

```yml
services:
  adguardhome:
    image: adguard/adguardhome
    container_name: adguardhome
    ports:
      - 53:53
      - 784:784/udp
      - 853:853/tcp
      - 30000:3000/tcp
      - 8090:80/tcp
      - 9443:443/tcp
    volumes:
      - /opt/docker/adguard/data/conf:/opt/adguardhome/conf
      - /opt/docker/adguard/data/work:/opt/adguardhome/work
    restart: unless-stopped
```
