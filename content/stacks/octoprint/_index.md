---
title: OctoPrint
description: The snappy web interface for your 3D printer.
---

## Docker Compose

```yml
---
# https://github.com/OctoPrint/octoprint-docker/blob/master/docker-compose.yml
services:
  octoprint:
    image: octoprint/octoprint
    container_name: octoprint
    restart: unless-stopped
    ports:
      - 8080:80
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
      - /dev/video0:/dev/video0
    volumes:
     - ./data:/octoprint
    environment:
      - ENABLE_MJPG_STREAMER=true
```
