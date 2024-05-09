# Cloudera

## How to identify if NUMA is enabled

NUMA has to enabled in the BIOS. If dmesg does not have records of numa initialization during bootup, then it is possible that NUMA related messages in the kernel ring buffer might have been overwritten.

## NUMA Enabled Systems

If NUMA is enabled on BIOS, then execute the command ‘numactl –hardware‘ to list inventory of available nodes on the system. Below is example output of numactl –hardware on a system which has NUMA.

> numactl --hardware

```bash
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3 4 5 6 7 16 17 18 19 20 21 22 23
node 0 size: 8157 MB
node 0 free: 88 MB
node 1 cpus: 8 9 10 11 12 13 14 15 24 25 26 27 28 29 30 31
node 1 size: 8191 MB
node 1 free: 5176 MB
node distances:
node   0   1 
  0:  10  20 
  1:  20  10
```

## NUMA Disabled Systems

### 1. If NUMA is disabled on BIOS, then the command ‘numactl –show‘ does not show multiple nodes.

> numactl --show

```bash
policy: default
preferred node: current
physcpubind: 0 1 2 3 4 5 6 7 8 9 10 11
cpubind: 0
nodebind: 0
membind: 0
```

### 2. The command ‘numactl –hardware‘ also does not list multiple nodes

```bash
available: 1 nodes (0)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11
node 0 size: 65525 MB
node 0 free: 17419 MB
node distances:
node   0
  0:  10
```

### 3. If the server does not have NUMA support or if the BIOS option is not enabled, then the following messages will be seen in dmesg

```bash
No NUMA configuration found
Faking a node at 0000000000000000-0000001027fff000
```

### 4. If ACPI is disabled, that will also disable NUMA; verify that ACPI is not disabled by a grub.conf kernel parameter and remove it if found:

```bash
$ grep acpi=off /proc/cmdline
```

## Charts Building

### Health

```SQL
select health_good_rate * 100 as "good health", health_concerning_rate * 100 as "concerning health", health_bad_rate * 100 as "bad health", health_disabled_rate * 100 as "disabled health", health_unknown_rate * 100 as "unknown health" where entityName="hdfs:$node-ha"
```

```sql
select health_good_rate * 100 as "good health" where entityName="hdfs:$node-ha"
```

### History

```SQL
select dfs_capacity as "HDFS",(dfs_capacity_used+dfs_capacity_used_non_hdfs) as "Used" where entityName="hdfs:$node-ha"
```

## System

### CPU

```sql
select cpu_user_rate / getHostFact(numCores, 1) * 100, cpu_system_rate / getHostFact(numCores, 1) * 100, cpu_nice_rate / getHostFact(numCores, 1) * 100, cpu_iowait_rate / getHostFact(numCores, 1) * 100, cpu_irq_rate / getHostFact(numCores, 1) * 100, cpu_soft_irq_rate / getHostFact(numCores, 1) * 100, cpu_steal_rate / getHostFact(numCores, 1) * 100 
```

### RAM

```sql
select swap_used, physical_memory_used, physical_memory_total WHERE hostname RLIKE ".*data.*"
```

## User Repository

List user home directories :

```bash
hdfs dfs -ls /user/
```

Get user home directory acl as example :
```bash
hdfs dfs -getfacl /user/JohnDoe
```

cf [Hadoop cheat-sheet](hadoop.md)
