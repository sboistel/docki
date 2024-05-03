# Red Hat Identity Management (IdM)

## Commandes

Show $USER 
```bash
ipa user-show monuser --all
```

## Client

Add Client :
```bash
ipa-client-install --domain=dnsname --server=fqdn --realm=DNSNAME --mkhomedir --ntp-server=iP1 --ntp-server=iP2
```
