---
title: Speedtest Tracker
description: A self-hosted speedtest result tracker and visualizer
---

## Docker compose

```yml
---
services:
  app:
    image: lscr.io/linuxserver/speedtest-tracker:latest
    container_name: speedtest-tracker
    restart: unless-stopped
      #    ports:
      #      - '8081:80'
    env_file: .env
    volumes:
      - /opt/docker/speedtest-tracker/data:/config
    healthcheck:
        test: 'curl -fSs http://localhost/api/healthcheck || exit 1'
        interval: 10s
        retries: '3'
        start_period: 30s
        timeout: 10s

networks:
  default:
    external: true
    name: external # Nginx Proxy Manager
```
