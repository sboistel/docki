---
title: Beszel
description: Self-hosted monitoring and alerting solution for Docker containers and host system metrics.
---

## Description

[Beszel](https://beszel.io/) is a self-hosted monitoring and alerting solution designed for Docker containers and host system metrics. It provides real-time insights into the performance and health of your Dockerized applications, allowing you to monitor resource usage, set up alerts, and visualize data through an intuitive dashboard.

![Beszel Dashboard](https://camo.githubusercontent.com/5eb9675b57e7dc21b4f3caf2d656e3ad7e2c310ea632ef818e8e8c6dd8416b4e/68747470733a2f2f68656e727967642d6173736574732e622d63646e2e6e65742f6265737a656c2f73637265656e73686f742d6e65772e706e67)

## Docker Compose

```yml
---
services:
  beszel:
    image: henrygd/beszel:latest
    container_name: beszel
    restart: unless-stopped
    networks:
      - external
    env_file: .env
    ports:
      - 8090:8090
    volumes:
      - ./data/_data:/beszel_data
      - ./data/socket:/beszel_socket

  beszel-agent:
    image: "henrygd/beszel-agent"
    container_name: "beszel-agent"
    restart: unless-stopped
    network_mode: host
    env_file: .env
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      # monitor other disks / partitions by mounting a folder in /extra-filesystems
      # - /mnt/disk/.beszel:/extra-filesystems/sda1:ro
      - /mnt/<your_disk_name>/.beszel:/extra-filesystems/sda1:ro
```
