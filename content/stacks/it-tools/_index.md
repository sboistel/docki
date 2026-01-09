---
title: IT Tools
description: A collection of web-based IT tools in a single container
---

## Description

IT Tools is a collection of web-based IT tools packaged into a single Docker container. It includes various utilities for network diagnostics, system monitoring, and other IT-related tasks, making it a convenient solution for IT professionals.

![IT Tools Screenshot](https://belginux.com/content/images/size/w1200/2024/12/it-tools.webp)

## Docker compose

```yml
---
services:
    it-tools:
        container_name: it-tools
        image: 'corentinth/it-tools:latest'
        ports:
            - '8181:80'
        restart: unless-stopped
```
