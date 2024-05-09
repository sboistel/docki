# Filesystem table AKA fstab

It is a set of rules used to control how different filesystems are treated each time they are introduced to a system.

## Structure

The table itself is a 6 column structure, where each column designates a specific parameter and must be set up in the correct order.

The columns of the table are as follows from left to right

```shell
# <file system> <mount point> <type> <options> <dump> <pass>
```

### Device

Usually the given name or UUID of the mounted device (sda1/sda2/etc).
Mount Point: designates the directory where the device is/will be mounted.

### File System Type

Nothing trick here, shows the type of filesystem in use.

### Options

Lists any active mount options. If using multiple options they must be separated by commas.

### Backup Operation (the first digit)

This is a binary system where 1 = dump utility backup of a partition. 0 = no backup. This is an outdated backup method and should NOT be used.

### File System Check Order (second digit)

Here we can see three possible outcomes.  

- 0 means that fsck will not check the filesystem.
    > Numbers higher than this represent the check order.
- The root filesystem should be set to 1 and other partitions set to 2.
