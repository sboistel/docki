---
title: CouchDB
description: Apache CouchDB is an open-source NoSQL database that uses JSON to store data, JavaScript for MapReduce queries, and HTTP for an API.
---

## Docker Compose

```yml
---
services:
  couchdb:
    image: couchdb
    container_name: couchdb
    restart: unless-stopped
    env_file: .env
    volumes:
      - ./data/couchdb/data:/opt/couchdb/data
      - ./data/couchdb/local.ini:/opt/couchdb/etc/local.ini
        #    ports:
        #      - 5984:5984

networks:
  default:
    external: true
    name: external
```
