# Proxmox-VE

## Subscription

How to remove Proxmox proxy subscription pop up ?

### Change to Active

Situated at the line ~120
Change the status to ``Active`` :

```BASH
sed -i.bak 's/NotFound/Active/g' /usr/share/perl5/PVE/API2/Subscription.pm
sed -i.bak 's/There is no subscription key/It seams to be active right ?/' /usr/share/perl5/PVE/API2/Subscription.pm
```

### Restart service
Restart pveproxy service & refresh next your web page :

```BASH
systemctl restart pveproxy.service
```

