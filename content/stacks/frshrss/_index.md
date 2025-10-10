---
title: FreshRSS
description: "A self-hosted RSS feed aggregator"
---

## Docker Compose

```yml
---
services:

  freshrss:
    image: freshrss/freshrss:latest
    # ports:
    #   - 8001:80
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

    labels: # https://github.com/glanceapp/glance/blob/main/docs/configuration.md#docker-containers
      glance.name: FreshRSS
      # glance.icon: 
      glance.url: https://frsh.sboistel.fr
      glance.description: Subscribe to RSS Feeds

networks:
  default:
    external: true
    name: external
```
