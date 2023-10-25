# Vagrant

## Install

### From source

!!! info Realese
* Add hashicorp repository

```bash
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```
    
* Installing package

```bash
dnf install vagrant
```
!!!

!!! info Old way

```bash
sudo yum install -y yum-utils
```

* Add hashicorp repository

```bash
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

* Installing package

```bash
sudo yum -y install vagrant
```
!!!
Source : (Install Vagrant)[https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant]

# Init project

```bash
vagrant init hashicorp/bionic64
```

!!! tip Vagrantfile
A `Vagrantfile` has been placed in this directory. 
You are now ready to `vagrant up` your first virtual environment! 
Please read the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
!!!