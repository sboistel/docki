---
title: Speedtest Tracker
description: A self-hosted speedtest result tracker and visualizer
---

## Description

[Speedtest Tracker](https://github.com/AdguardTeam/speedtest-tracker) is a self-hosted speedtest result tracker and visualizer. It collects results from speedtest.net and presents them in a user-friendly web interface with charts and statistics.

## Docker compose

```yml
---
services:
  app:
    image: lscr.io/linuxserver/speedtest-tracker:latest
    container_name: speedtest-tracker
    restart: unless-stopped
    ports:
      - '8081:80'
    volumes:
      - ./data:/config
    healthcheck:
        test: 'curl -fSs http://localhost/api/healthcheck || exit 1'
        interval: 10s
        retries: '3'
        start_period: 30s
        timeout: 10s
```
