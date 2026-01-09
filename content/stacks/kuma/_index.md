---
title: Uptime Kuma
description: A self-hosted monitoring tool like "Uptime Robot"
---

## Description

Uptime Kuma is a self-hosted monitoring tool that allows you to monitor the uptime of your websites, services, and applications. It provides a user-friendly interface and supports various notification methods to alert you when your services go down.

## Docker compose

```yml
---
services:
  uptime-kuma:
    container_name: kuma
    image: louislam/uptime-kuma:latest
    restart: unless-stopped
    ports:
      - 3001:3001
    volumes:
      - ./data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations
```
