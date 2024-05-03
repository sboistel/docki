---
title: sshs
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## sshs

Terminal user interface for SSH.  
It uses `~/.ssh/config` to list and connect to hosts.

[![example](https://i.imgur.com/iPmiEVU.gif)](https://asciinema.org/a/465800)

## Requirements

You need to have `ssh` installed and accessible from your terminal.

## How to install

### Homebrew

```shell
brew install sshs
```

### Chocolatey

Thanks to [Jakub Levý](https://github.com/jakublevy/chocopkgs/tree/master/sshs) for maintaining this package on Chocolatey.

```shell
choco install sshs
```

### From releases

Releases contains prebuilt binaries for Linux, macOS and Windows. You can download them at https://github.com/quantumsheep/sshs/releases.

### From sources

```bash
git clone https://github.com/quantumsheep/sshs.git
cd sshs
make
make install
```

You can check the main repository : https://github.com/quantumsheep/sshs
