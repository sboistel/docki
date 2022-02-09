# Rhel IDM
Show $USER 
> ipa user-show monuser --all

Client
======
Add Client :
> ipa-client-install --domain=dnsname --server=fqdn --realm=DNSNAME --mkhomedir --ntp-server=iP1 --ntp-server=iP2

