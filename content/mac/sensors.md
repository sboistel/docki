---
title: sensors
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Sensors

## Get Temperature

### Intel chipset

```zsh
sudo powermetrics -n 1 --samplers smc | egrep -i "FAN|CPU die|GPU die"
```
