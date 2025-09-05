---
title: "Sensors"
description: "Monitoring hardware sensors on macOS"
tags: ["mac", "sensors"]
---

## Get Temperature

### Intel chipset

```zsh
sudo powermetrics -n 1 --samplers smc | egrep -i "FAN|CPU die|GPU die"
```
