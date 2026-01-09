---
title: Home Assistant
description: "Home Assistant is an open-source home automation platform that focuses on privacy and local control. It allows you to integrate and automate various smart home devices and services."
---

## Description

Home Assistant is an open-source home automation platform that prioritizes privacy and local control. It enables users to integrate and automate a wide range of smart home devices and services, providing a centralized system for managing home automation tasks.

## Docker Compose

```yml
---
services:
  homeassistant:
    #image: homeassistant/home-assistant:stable
    image: ghcr.io/home-assistant/home-assistant:stable
    container_name: hass
    environment:
      - TZ=Europe/Paris
    ports:
      - 8123:8123
    volumes:
      - ./data/config:/config
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
```