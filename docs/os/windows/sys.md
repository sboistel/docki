# System
Here are somes DOS tips & tricks

## Systeminfo
Trouver la date d’installation Windows.

```POWERSHELL
systeminfo | find "installation"
```

Se rendre rapidement sur la page de gestion des software: 
Éxécuter la commande suivante (dans invite de commande ou executer ou menu démarré)

```POWERSHELL
Appwiz.cpl
```

## Hosts file
Hosts file configuration location :

```POWERSHELL
C:\windows\system32\drivers\etc\
```

## Kill task
How to force killing task? 

```POWERSHELL
taskkill /F /IM OpenWith.exe /T
```

## License
Temps restant disponible à la license en cours

```powershell
slmgr -dlv
```