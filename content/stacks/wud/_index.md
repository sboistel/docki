---
title: What's Up Docker?
description: A curated collection of Docker resources, tutorials, and best practices to help you get the most out of containerization.
---

## Description

"What's Up Docker?" is your go-to resource for all things Docker. Whether you're a beginner looking to get started with containerization or an experienced developer seeking advanced tips and best practices, this collection has something for you. Explore tutorials, guides, and curated resources to enhance your Docker skills and streamline your development workflow.

## Docker Compose

```yml
---
# https://getwud.github.io/wud
services:
  whatsupdocker:
    image: getwud/wud
    container_name: wud
    restart: unless-stopped
    env_file: .env
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 3002:3000
    environment:
      - WUD_LOG_LEVEL=info
      - WUD_WATCHER_LOCAL_CRON=0 3 * * *
      - WUD_WATCHER_LOCAL_WATCHBYDEFAULT=true
      - WUD_TRIGGER_LOCAL_PRUNE=true
      - WUD_TRIGGER_APPRISE_BODY={{json .}}
```
