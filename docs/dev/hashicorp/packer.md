# Packer

## Installation

### Centos/Redhat/Rocky

* Add hashicorp repository

```shell
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

* Installing package

```shell
dnf install packer
```

### Ubuntu/Debian

Add the HashiCorp [GPG key](https://apt.releases.hashicorp.com/gpg "HashiCorp GPG key").

```bash
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository.

```bash
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update and install.

```bash
$ sudo apt-get update && sudo apt-get install packer
```

## Subcommands

```bash
Usage: packer [--version] [--help] <command> [<args>]

Available commands are:
    build           build image(s) from template
    console         creates a console for testing variable interpolation
    fix             fixes templates from old versions of packer
    fmt             Rewrites HCL2 config files to canonical format
    hcl2_upgrade    transform a JSON template into an HCL2 configuration
    init            Install missing plugins or upgrade plugins
    inspect         see components of a template
    plugins         Interact with Packer plugins and catalog
    validate        check that a template is valid
    version         Prints the Packer version
```

Most of the commands accept or require flags or ags to execute the desired functionnality

## Install autocomplete

That enable tab completion when using the CLI

```bash
packer -autocomplete-install
```

## Packer Build

The packer build command takes a Packer temmplate and runs all the defined builds to generate the desired artifacts. <br>
The build command provides the core functionality of Packer.

!!! note "Terminal"

	```bash
	packer build packer_template.hcl
	```

!!! info "Important Options/Arguments"

	-debub : enables debug mode fpr step-by-step troubleshooting
	- var : set a variable in the Packer template
	- var-file : use a separate variable file

## Environment variables

Packer has a few environment variables :

- PACKER_LOG : enable Packer detailed logs (off by default)
- PACKER_LOG_PATH : set the path of Packer logs to specific file (rather than stderr)
- PKR_VAR_xxx : define a variable value using ENV rather than in a template
