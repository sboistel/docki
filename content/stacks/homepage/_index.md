---
title: Homepage
description: A fast, modular, and privacy-focused dashboard for your server
---

## Description

[Homepage](https://github.com/gethomepage/homepage) is a fast, modular, and privacy-focused dashboard for your server. It provides a clean and customizable interface to monitor and manage your services, applications, and system status. Homepage is designed to be lightweight and easy to deploy, making it an excellent choice for users who want a simple yet powerful dashboard solution.

![Homepage Overview](https://raw.githubusercontent.com/gethomepage/homepage/refs/heads/dev/images/1.png)

## Docker compose

```yml
---
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: homepage
    env_file: .env
    restart: unless-stopped
    ports:
      - 3000:3000
    volumes:
      - ./data/app:/app/config
      - ./data/resources:/app/public/icons
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations

```
