# Applications
Created Tuesday 25 January 2022

Google Chrome
=============

kiosk mode
==========
Ouvrir une page web avec Google Chrome dans une page détachée: 

```POWERSHELL
Chrome.exe --app=http://
```

Windows Subsystem Linux
=======================

⚠️ This action requires a system restart

How to enable Windows Subsystem for Linux using powershell as **admin** ?

```POWERSHELL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

