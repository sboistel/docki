---
title: performance
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Newtork performances

On Server side :

```bash title="10 = secondes"
iperf -s -i 10
```

On client host :

```bash title="$SERVER = target @iP"
iperf -i 10 -c $SERVER
```

