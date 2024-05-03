# Vagrant

## Install

From source

=== "Realese"

    * Add hashicorp repository

    ```shell
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    ```
    
    * Installing package

    ```shell
    dnf install vagrant
    ```

=== "Old way"

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

Source : (Install Vagrant)[https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant]

# Init project

```shell
vagrant init hashicorp/bionic64
```

> A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
