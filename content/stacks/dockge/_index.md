---
title: Dockge
description:  A fancy, easy-to-use and reactive self-hosted docker compose.yaml stack-oriented manager
---

## What is Dockge?

Dockge is a web application designed to simplify the management of Docker Compose stacks. <br>
It provides a user-friendly interface to **create**, **edit**, and **manage** your Docker Compose files, making it easier to deploy and maintain your containerized applications.

![Dockge Interface](https://private-user-images.githubusercontent.com/1336778/280767691-26a583e1-ecb1-4a8d-aedf-76157d714ad7.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Njc5NDkwMDIsIm5iZiI6MTc2Nzk0ODcwMiwicGF0aCI6Ii8xMzM2Nzc4LzI4MDc2NzY5MS0yNmE1ODNlMS1lY2IxLTRhOGQtYWVkZi03NjE1N2Q3MTRhZDcucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI2MDEwOSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNjAxMDlUMDg1MTQyWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9YWYwMTJiYTMyNzYyMDQ5OTI4NzljZTkyNTAwOGE5NTc2YjMwOWIxY2I0ZjE0ZmI2ZjUxMTgzYWM0MDRmYmY4NCZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.QBlTaXqwF3cztCO6y5SUlh97WySmfxiMnAZM9nr50YA)

## Docker Compose

```yml
---
services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    container_name: dockge
    ports:
      # Host Port : Container Port
      - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data

      # If you want to use private registries, you need to share the auth file with Dockge:
      # - /root/.docker/:/root/.docker

      # Stacks Directory
      # ⚠️ READ IT CAREFULLY. If you did it wrong, your data could end up writing into a WRONG PATH.
      # ⚠️ 1. FULL path only. No relative path (MUST)
      # ⚠️ 2. Left Stacks Path === Right Stacks Path (MUST)
      - /opt/docker:/opt/stacks
    environment:
      # Tell Dockge where is your stacks directory
      - DOCKGE_STACKS_DIR=/opt/stacks
```
