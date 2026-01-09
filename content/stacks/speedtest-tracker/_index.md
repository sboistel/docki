---
title: Speedtest Tracker
description: A self-hosted speedtest result tracker and visualizer
---

## Description

[Speedtest Tracker](https://github.com/AdguardTeam/speedtest-tracker) is a self-hosted speedtest result tracker and visualizer. It collects results from speedtest.net and presents them in a user-friendly web interface with charts and statistics.

![Overview](https://docs.speedtest-tracker.dev/~gitbook/image?url=https%3A%2F%2F3367574858-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252Fvtb3s6TB12XY9iIx8YyJ%252Fuploads%252Fgit-blob-d0f172c3d1e35390970f750fc04d5107f130689c%252Fdashboard.png%3Falt%3Dmedia&width=768&dpr=4&quality=100&sign=1abf8a85&sv=2)

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
