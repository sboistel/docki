---
title: "AdGuard Home"
description: "A network-wide software for blocking ads & tracking."
---

## Description

AdGuard Home is a network-wide software for blocking ads & tracking. It operates as a DNS server that filters requests based on predefined rules, providing ad-blocking and privacy protection for all devices connected to the network.

![AdGuard Home](https://camo.githubusercontent.com/de063867329de7272ec4f17e1a338a56a5e5913c6cb8a2f39b63f4f0eb2fb50d/68747470733a2f2f63646e2e6164746964792e6f72672f7075626c69632f416467756172642f436f6d6d6f6e2f616467756172645f686f6d652e676966)

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
