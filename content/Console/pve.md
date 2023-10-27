# Proxmox Virtual Environment

## Subscription

How to remove Proxmox proxy subscription pop up ?

### Change to Active

Situated at the line ~120
Change the status to ``Active`` :

```bash
sed -i.bak 's/notfound/active/g' /usr/share/perl5/PVE/API2/Subscription.pm
sed -i.bak 's/There is no subscription key/It seams to be active right ?/' /usr/share/perl5/PVE/API2/Subscription.pm
```

### Restart service

Restart pveproxy service & refresh next your web page :

```bash
systemctl restart pveproxy.service
```

## Grub

> /etc/default/grub

```bash
GRUB_DISTRIBUTOR="Proxmox Virtual Environnement"
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"
GRUB_CMDLINE_LINUX="consoleblank=300"
```

### Apply grub modifications

```bash
update-grub
```

or

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

or

```bash
grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Modules

> /etc/modules

```bash
# Virtual Function I/O
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd

# Chip drivers
coretemp
```

### Update initramfs

```bash
update-initramfs -u -k all
```

## Repositories

> /etc/apt/sources.list

```bash
# not for production use
deb http://download.proxmox.com/debian buster pve-no-subscription
```

> /etc/apt/sources.list.d/pve-enterprise.list

```bash
# deb https://enterprise.proxmox.com/debian/pve bullseye pve-enterprise
```
