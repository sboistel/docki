---
title: windows-system
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## System

Trouver la date d’installation Windows.

```powershell
systeminfo | find "installation"
```

Se rendre rapidement sur la page de gestion des software: 
Éxécuter la commande suivante (dans invite de commande ou executer ou menu démarré)

```powershell
Appwiz.cpl
```

## Hosts file

Hosts file configuration location :

```powershell
C:\windows\system32\drivers\etc\
```

## License

Temps restant disponible à la license en cours

```powershell
DISM /online /Get-CurrentEdition
DISM /online /Get-TargetEditions
slmgr.vbs /ipk LICENCE #"Force" || Dism /Online /Set-Edition:ServerDatacenter /AcceptEula /ProductKey:LICENCE
slmgr.vbs /dlv #Check
```
