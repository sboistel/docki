---
title: Glance
description: A simple and modern dashboard to manage your services
---

## Description

Glance is a simple and modern dashboard application that allows you to manage and monitor your self-hosted services. It provides an easy-to-use interface to view the status of your applications, access their dashboards, and organize them in a visually appealing way. Glance supports various authentication methods and can be customized to fit your needs.

## Docker compose

```yml
---
services:
  glance:
    image: glanceapp/glance
    container_name: glance
    env_file: .env
    volumes:
      - ./data:/app/config
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 8080:8080
    restart: unless-stopped
```
