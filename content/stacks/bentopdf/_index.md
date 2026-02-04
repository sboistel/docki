---
title: "BentoPDF"
description: "A self-hosted document viewer and management system."
---

## Description

BentoPDF is a powerful, privacy-first, client-side PDF toolkit that is self hostable and allows you to manipulate, edit, merge, and process PDF files directly in your browser. No server-side processing is required, ensuring your files remain secure and private.

Github: [github.com/alam00000/bentopdf](https://github.com/alam00000/bentopdf)

<div align="center">
  <img width="800" alt="BentoPDF Interface" src="https://raw.githubusercontent.com/alam00000/bentopdf/main/public/images/bentopdf-tools.png" />
</div>

## Docker Compose

```yml
services:
  bentopdf:
    image: bentopdf/bentopdf
    container_name: bentopdf
    ports:
      - '3000:8080'
    restart: unless-stopped
```
