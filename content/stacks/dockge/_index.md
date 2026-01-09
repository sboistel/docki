---
title: Dockge
description:  A fancy, easy-to-use and reactive self-hosted docker compose.yaml stack-oriented manager
---

## What is Dockge?

Dockge is a web application designed to simplify the management of Docker Compose stacks. <br>
It provides a user-friendly interface to **create**, **edit**, and **manage** your Docker Compose files, making it easier to deploy and maintain your containerized applications.

## Docker Compose

```yml
---
services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    container_name: dockge
    ports:
      # Host Port : Container Port
      - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data

      # If you want to use private registries, you need to share the auth file with Dockge:
      # - /root/.docker/:/root/.docker

      # Stacks Directory
      # ⚠️ READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH.
      # ⚠️ 1. FULL path only. No relative path (MUST)
      # ⚠️ 2. Left Stacks Path === Right Stacks Path (MUST)
      - /opt/docker:/opt/stacks
    environment:
      # Tell Dockge where is your stacks directory
      - DOCKGE_STACKS_DIR=/opt/stacks
```
