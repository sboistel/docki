# Package manager

## RPM

How to force installation without depedency.

```bash
rpm -Uvh 
```

## Debian

### Repository

* bullseye 11 sources.list

```shell
deb http://deb.debian.org/debian bullseye main
deb-src http://deb.debian.org/debian bullseye main

deb http://deb.debian.org/debian-security/ bullseye-security main
deb-src http://deb.debian.org/debian-security/ bullseye-security main

deb http://deb.debian.org/debian bullseye-updates main
deb-src http://deb.debian.org/debian bullseye-updates main
```
