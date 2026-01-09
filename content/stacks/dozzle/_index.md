---
title: Dozzle
description: Dozzle is a lightweight log viewer for Docker containers. It provides a simple web interface to view and search through container logs in real-time.
---

## Description

Dozzle is a lightweight log viewer for Docker containers. It provides a simple web interface to view and search through container logs in real-time. Dozzle connects directly to the Docker socket, allowing it to access logs from all running containers on the host machine. It is designed to be easy to use and deploy, making it a popular choice for developers and system administrators who need to monitor container logs.

· Demo https://github.com/user-attachments/assets/66a7b4b2-d6c9-4fca-ab04-aef6cd7c0c31

## Docker Compose

```yml
---
services:
  dozzle:
    container_name: dozzle
    restart: unless-stopped
    image: amir20/dozzle:latest
    ports:
      - 9135:8080
    env_file:
      - .env
    environment:
      - DOZZLE_HOSTNAME=${DOMAIN}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
