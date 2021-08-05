# Charts Building

## Health
```SQL
select health_good_rate * 100 as "good health", health_concerning_rate * 100 as "concerning health", health_bad_rate * 100 as "bad health", health_disabled_rate * 100 as "disabled health", health_unknown_rate * 100 as "unknown health" where entityName="hdfs:$node-ha"
```

```sql
select health_good_rate * 100 as "good health" where entityName="hdfs:$node-ha"
```

## History
```SQL
select dfs_capacity as "HDFS",(dfs_capacity_used+dfs_capacity_used_non_hdfs) as "Used" where entityName="hdfs:$node-ha"
```

# System

## CPU 
```sql
select cpu_user_rate / getHostFact(numCores, 1) * 100, cpu_system_rate / getHostFact(numCores, 1) * 100, cpu_nice_rate / getHostFact(numCores, 1) * 100, cpu_iowait_rate / getHostFact(numCores, 1) * 100, cpu_irq_rate / getHostFact(numCores, 1) * 100, cpu_soft_irq_rate / getHostFact(numCores, 1) * 100, cpu_steal_rate / getHostFact(numCores, 1) * 100 
```

## RAM
```sql
select swap_used, physical_memory_used, physical_memory_total WHERE hostname RLIKE ".*data.*"
```