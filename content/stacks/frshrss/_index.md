---
title: FreshRSS
description: "A self-hosted RSS feed aggregator"
---

## Description

FreshRSS is a self-hosted RSS feed aggregator that allows you to read and manage your RSS feeds in one place. It is designed to be lightweight, easy to use, and highly customizable. FreshRSS supports multiple users, themes, and extensions, making it a versatile choice for personal or shared use.

![FreshRSS Owerview](https://raw.githubusercontent.com/FreshRSS/FreshRSS/edge/docs/img/FreshRSS-screenshot.png)

## Docker Compose

```yml
---
services:

  freshrss:
    image: freshrss/freshrss:latest
    ports:
      - 80:80
    container_name: frshrss
    hostname: freshrss
    restart: unless-stopped
    user: '0'

    # Optional build section if you want to build the image locally:
    build:
      # Pick #latest (stable release) or #edge (rolling release) or a specific release like #1.21.0
      context: https://github.com/FreshRSS/FreshRSS.git#latest
      dockerfile: Docker/Dockerfile-Alpine

    logging:
      options:
        max-size: 10m

    volumes:
      - ./data:/var/www/FreshRSS/data
      - ./extensions:/var/www/FreshRSS/extensions

    environment:
      TZ: Europe/Paris
      CRON_MIN: '3,33'
      # TRUSTED_PROXY: 172.16.0.1/12 192.168.0.1/16
```
