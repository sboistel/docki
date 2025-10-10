---
title: Beszel
description: Self-hosted monitoring and alerting solution for Docker containers and host system metrics.
---

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
      #    ports:
      #      - 8090:8090
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

networks:
  external:
    external: true
    name: external
```
