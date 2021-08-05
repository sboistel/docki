#  Packages

# RPM

How to force installation without depedency.

```bash
rpm -Uvh --nodeps $(repoquery --location centreon-plugins)
```

# APT

## bpytop

How to isntall bpytop :

```bash
apt install python3-pip
pip3 install psutil
pip3 install bpytop
```