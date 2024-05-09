# Free IPA

## Hostname
> echo "ldap{01,02}.home.test ldap{1,2}" > /etc/hostname

## Firewall
> firewall-cmd --add-service=freeipa-ldap{,s} --permanent
> firewall-cmd --reload

## FreeIPA serv{dns} packages
> yum install ipa-server ipa-server-dns

## FreeIPA setup
> ipa-server-install

ou

```bash
ipa-server-install -U -p user -a password --ip-address=ip -n fqdn -r FQDN --hostname=${hostname -f} --setup-dns --auto-reverse
```

## Autau create home directory
> authconfig --enablemkhomedir --update

## Check access
> ipactl status

## Kerebros token : admin
> kinit admin
> klist

---
## Steps

### 1
> nmtui -> hostname ldap0{1,2}.ipa.test

### 2
> echo "$(hostname -I) $(hostname -f) ldap0{1,2}" >> /etc/hosts

### 3
> firewall-cmd --add-service=freeipa-ldap{,s} --permanent
> firewall-cmd --reload

### 4
> yum install freeipa-server ipa-server-dns

###5
> ipa-server-install

### 6 
> kinit admin
> ipa user-add
> ipa passwrd
> yum install ipa-server
> hostnamctl set-hostname freeipa.sboistel.lan
> ipa-server-install --setup-dns