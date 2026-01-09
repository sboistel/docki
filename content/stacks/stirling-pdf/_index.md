---
title: Stirling-PDF
description: A self-hosted PDF generation and OCR service
---

## Description

Stirling-PDF is a self-hosted service that provides PDF generation and OCR capabilities. It leverages Tesseract OCR for text recognition and can be customized with additional language data and configurations.

## Docker compose

```yml
---
services:
  stirling-pdf:
    image: frooodle/s-pdf:latest
    container_name: stirling-pdf
    restart: unless-stopped
    ports:
      - '8003:8080'
    volumes:
      - ./data/trainingData:/usr/share/tesseract-ocr/5/tessdata
      - ./data/extraConfigs:/configs
      - ./data/customFiles:/customFiles/
#      - /location/of/trainingData:/usr/share/tesseract-ocr/5/tessdata #Required for extra OCR languages
#      - /location/of/extraConfigs:/configs
#      - /location/of/customFiles:/customFiles/
    environment:
      - DOCKER_ENABLE_SECURITY=false
```
