---
title: "Borg UI"
description: "A web-based user interface for managing BorgBackup repositories."
---

## Description

Borg UI is a web-based user interface for managing BorgBackup repositories. It provides an easy-to-use interface for creating, restoring, and managing backups, making it accessible for users who prefer not to use command-line tools.

Github: [github.com/karanhudia/borg-ui](https://github.com/karanhudia/borg-ui)

<div align="center">
  <img width="800" alt="Modern Dashboard with activity monitoring" src="https://github.com/user-attachments/assets/3e9c7ae6-1507-4fe1-8f8b-8231a458bca0" />
</div>

## Docker Compose

```yml
---
services:
  borg-ui:
    image: ainullcode/borg-ui:latest
    container_name: borg-ui
    restart: unless-stopped
    ports:
      - "8081:8081"
    volumes:
      - ./data:/data
      - ./cache:/home/borg/.cache/borg
      # Mount directories you want to backup (REPLACE with your actual paths)
      - /opt/docker:/local/stack:ro     # Replace with your directory path
    environment:
      - TZ=Europe/Paris # Set your timezone
      - PUID=0 # 1000
      - PGID=0 # 1000
```
