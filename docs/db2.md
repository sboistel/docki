# IBM DB2

## Installation
As root

Untar the archive file
```bash
tar -xvf linuxx64_client.tar.gz
```

Install db2
```bash
./client/db2_install  -b /opt/db/v11.5
```

## Create user client
```bash
/opt/ibm/db2/v11.5/instance/db2icrt -s client lully
```

## Migration
As root

```bash
db2cfexp db2cfexp.log template
```

As instance user

db2cfimp export.log

# Check directories
db2 

```
list db directory
list node directory
```