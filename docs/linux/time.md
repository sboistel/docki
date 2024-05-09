# Clock

How to mod sys clock ?

```bash
mv /etc/localtime /etc/localtime.backup
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

echo "Europe/Paris" | tee /etc/timezone
timedatectl set-timezone Europe/Paris
hwclock -s
```
