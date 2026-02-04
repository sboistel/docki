---
title: "PruneMate"
description: "A self-hosted tool to automate pruning of media libraries."
---

## Description

PruneMate is a self-hosted tool designed to help you automate the pruning of your media libraries. It connects to various media server APIs, such as Plex, Emby, or Jellyfin, and removes media files based on customizable criteria like watch status, age, or file size. This helps you manage storage space efficiently and keep your media library organized.

Github: [github.com/anoniemerd/PruneMate](https://github.com/anoniemerd/PruneMate)

![PruneMate Dashboard](https://private-user-images.githubusercontent.com/105949775/537110260-863d7884-5da1-4f5b-b3cc-33cffd32f931.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzAxODg3NjgsIm5iZiI6MTc3MDE4ODQ2OCwicGF0aCI6Ii8xMDU5NDk3NzUvNTM3MTEwMjYwLTg2M2Q3ODg0LTVkYTEtNGY1Yi1iM2NjLTMzY2ZmZDMyZjkzMS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDIwNFQwNzAxMDhaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01ZjE1MGQ0YTAxMmI5MDBmYmRjOWU4NDM5OGY1M2QyZjJiOWUzNWMzNmI0Mzc5ZGRlMjA0Njk4OWIzYzlhNjdhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.dSxAwLBj2QNCVuz6tI7GzCJ69zz5j1uqGblD_AYAeWI)

## Docker Compose

```yml
services:
  prunemate:
    image: 
    container_name: prunemate
    ports:
      - "7676:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./logs:/var/log
      - ./config:/config
    environment:
      - PRUNEMATE_TZ=Europe/Paris # Change this to your desired timezone
      - PRUNEMATE_TIME_24H=true #false for 12-Hour format (AM/PM)
      # Optional: Enable authentication (generate hash with: docker run --rm anoniemerd/prunemate python prunemate.py --gen-hash "password")
      - PRUNEMATE_AUTH_USER=admin
      - PRUNEMATE_AUTH_PASSWORD_HASH=your_base64_encoded_hash_here
    restart: unless-stopped
```
