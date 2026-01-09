---
title: OctoPrint
description: The snappy web interface for your 3D printer.
---

## Description

[OctoPrint](https://octoprint.org/) is a powerful open-source web interface for controlling and monitoring 3D printers. It allows users to manage print jobs, monitor printer status, and control various aspects of the printing process remotely. OctoPrint supports a wide range of 3D printers and offers features such as webcam streaming, G-code visualization, and plugin support for extended functionality.

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
