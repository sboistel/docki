# QEMU-KVM

### How to convert ?

How to convert **qcow2** virtual disk file ? :

```BASH
qemu-img convert -f qcow2 qcow2_file_name -O vdi vdi_file_name
```

#### Example :

Format centos7_64.qcow2 image to vdi file :

```BASH
qemu-img convert -f qcow2 centos7_64.qcow2 -O vdi centos7_64.vdi
```

