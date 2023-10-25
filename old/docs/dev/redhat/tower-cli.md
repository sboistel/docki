# Tower-CLI

Tower-cli is a command line tool for Ansible Tower. It allows Tower commands to be easily run from the UNIX command line. It can also be used as a client library for other python apps, or as a reference for others developing API interactions with Tower’s REST API.

## Installation

Installing the ansible tower-cli through two differents methodes. Python Virtual environenment or from git hub

### From Source

Using the main repository : [tower-cli](https://github.com/ansible/tower-cli.git)

Clone it and make the installation

```shell
git clone https://github.com/ansible/tower-cli.git
make install
```

### Python Venv

Use python pip

```pyhton
pip install tower-cli
```

## Configuration

You can configure tower-cli from `~/.tower_cli.cfg` file situated on your own home or /etc/tower-cli/tower-cli.

By default, this file is about :

```shell
$ tower-cli config

# Defaults.
verify_ssl: True
username:
format: human
insecure: False
color: True
use_token: False
host: 127.0.0.1
certificate:
oauth_token:
password:
verbose: False
description_on: False
```

Let insert element one by one like :

```shell
tower-cli config username = toto
```

or modify the configuration file.

## Usage

### Inventories

List **Hosts** by inventory

-i : inventory name

-a : all (pages)

```python
tower-cli host list -i inventoriy_name -a
```

## Team

Associate user to team :

```python
tower-cli team associate --user user_name --team team_name
```

## Group

Associate user to group :

```python
tower-cli group associate --user user_name --group group_name
```

## Host

Associate host to group :

```python
tower-cli host associate --host host_name --group group_name
```
