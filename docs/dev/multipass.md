# Multipass

Multipass is a tool to generate cloud-style Ubuntu VMs quickly on Linux, macOS, and Windows.

## Commands

| Commands | Description |
| - | - |
| alias | Create an alias |
| aliases | List available aliases |
| authenticate | Authenticate client |
| delete | Delete instances |
| exec | Run a command on an instance |
| find | Display available images to create instances from |
| get | Get a configuration setting |
| help | Display help about a command |
| info | Display information about instances |
| launch | Create and start an Ubuntu instance |
| list | List all available instances |
| mount | Mount a local directory in the instance |
| networks | List available network interfaces |
| purge | Purge all deleted instances permanently |
| recover | Recover deleted instances |
| restart | Restart instances |
| set | Set a configuration setting |
| shell | Open a shell on a running instance |
| start | Start instances |
| stop | Stop running instances |
| suspend | Suspend running instances |
| transfer | Transfer files between the host and instances |
| umount | Unmount a directory from an instance |
| unalias | Remove aliases |
| version | Show version details |

## Installation

```shell
brew install --cask multipass
```

## Version

```shell
multipass version
```

```shell
$ multipass version
multipass   1.11.1+mac
multipassd  1.11.1+mac
```

## Gather

### List

Syntax :

```shell
multipass list
```

Example :

```shell
$ multipass list
Name                    State             IPv4             Image
test1                   Running           192.168.64.17    Ubuntu 22.04 LTS
```

### Infos

Syntax :

```shell
multipass info $VM
```

Example :

```shell
$ multipass info test1
Name:           test1
State:          Running
IPv4:           192.168.64.17
Release:        Ubuntu 22.04.1 LTS
Image hash:     8593ce1c6bbd (Ubuntu 22.04 LTS)
CPU(s):         1
Load:           0.32 0.17 0.06
Disk usage:     1.4GiB out of 4.7GiB
Memory usage:   150.8MiB out of 962.7MiB
Mounts:         --
```

## Launch

Syntax :

```shell
multipass launch -n $VM
```

## Connect to VM

```shell
multipass shell $VM
```

# References
- https://multipass.run/docs/
