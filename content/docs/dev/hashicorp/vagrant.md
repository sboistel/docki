---
title: "Vagrant"
description: "Vagrant est un outil de virtualisation qui permet de créer et de gérer des environnements de développement reproductibles."
tags: ["vagrant", "virtualization", "development"]
---

## Install

### From source

{{% details title="Release" %}}

* Add hashicorp repository

```shell
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

* Installing package

```shell
dnf install vagrant
```

{{% /details %}}

{{% details title="Old way" closed="true" %}}

```shell
sudo yum install -y yum-utils
```

* Add hashicorp repository

```shell
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

* Installing package

```shell
sudo yum -y install vagrant
```

{{% /details %}}

ref:

* [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)

---

```shell
vagrant init hashicorp/bionic64
```

>[!TIP] Note
> A `Vagrantfile` has been placed in this directory. <br>
> You are now ready to `vagrant up` your first virtual environment! <br>
> Please read the comments in the Vagrantfile as well as documentation on `vagrantup.com` for more information on using Vagrant.
