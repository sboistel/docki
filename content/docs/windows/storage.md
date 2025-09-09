---
title: "Storage"
description: ""
tags: [""]
---

## How to change device drive icon ?

Open regedit as administrator :

* Go to ``Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersionxplorer\DriveIcons``
* Create a new key as the correspond lettre of your drive.
* Create a new sub key as ``Defaulticon`` :

```powershell
Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersionxplorer\DriveIcons\D\Defaulticon
```

Mod the chaine containned in Defaulticon key with the full path of your ``ico`` file.
