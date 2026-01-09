---
title: File Browser
description: "File Browser is a web-based file manager that allows you to manage your files and directories through a user-friendly interface."
---

## Description

File Browser is a web-based file manager that allows you to manage your files and directories through a user-friendly interface. It provides features such as file upload, download, preview, and organization, making it easy to handle files on a server without needing direct access via FTP or SSH.

## Docker Compose

```yml
services:
  filebrowser:
    image: hurlenko/filebrowser
    container_name: filebrowser
    ports:
      - 8443:8080
    volumes:
      - /opt/docker/filebrowser/config:/config
      - /galaxy/shared/:/data
    environment:
      - FB_BASEURL=/filebrowser
    restart: unless-stopped
```