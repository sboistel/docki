---
title: Navidrome
description: A self-hosted music server and streamer
---

## Description

Navidrome is a self-hosted music server and streamer that allows you to access your music collection from anywhere. It supports a wide range of audio formats and provides a user-friendly web interface for managing and playing your music.

## Docker compose

```yml
---
services:
  navidrome:
    image: deluan/navidrome:latest
    container_name: navidrome
    ports:
      - "4533:4533"
    restart: unless-stopped
    volumes:
      - "./data:/data"
```
