# Nagios
Installation
============

rhel7
-----
```bash
yum install -y yum-utils
yum-config-manager --enable rhel-7-server-optional-rpms
```

oel
---
```bash
yum install -y yum-utils
yum-config-manager --enable ol7_optional_latest
```

script
------
> curl <https://assets.nagios.com/downloads/nagiosxi/install.sh> | sh

Configuration
=============
File : `/etc/nagios/objects/commands.cfg`

