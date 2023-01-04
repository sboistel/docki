# Vagrant

## Install from source

* Add hashicorp repository

```shell
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

* Installing package

```shell
dnf install vagrant
```

# Init project

```shell
vagrant init hashicorp/bionic64
```

> A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
