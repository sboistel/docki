# Environment Variables in Windows

## How to use them in PowerShell
Environment Varaibles can be used in PowerShell ([[powershell]]) with the prefix `$env:`.

**Example***:
*Variable:*  `%APPDATA%`
*In Powershell:* `$env:APPDATA`

## List of environment variables
Variable | Description
---|---
`%ALLUSERSPROFILE%`|C:\ProgramData
`%APPDATA%`|C:\Users\{username}\AppData\Roaming
`%COMMONPROGRAMFILES%`|C:\Program Files\Common Files
`%COMMONPROGRAMFILES(x86)%`|C:\Program Files (x86)\Common Files
`%CommonProgramW6432%`|C:\Program Files\Common Files
`%COMSPEC%`|C:\Windows\System32\cmd.exe
`%HOMEDRIVE%`|C:\
`%HOMEPATH%`|C:\Users\{username}
`%LOCALAPPDATA%`|C:\Users\{username}\AppData\Local
`%LOGONSERVER%`|\\{domain_logon_server}
`%PATH%`|C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem
`%PathExt%`|.com;.exe;.bat;.cmd;.vbs;.vbe;.js;.jse;.wsf;.wsh;.msc
`%PROGRAMDATA%`|C:\ProgramData
`%PROGRAMFILES%`|C:\Program Files
`%ProgramW6432%`|C:\Program Files
`%PROGRAMFILES(X86)%`|C:\Program Files (x86)
`%PROMPT%`|$P$G
`%SystemDrive%`|C:
`%SystemRoot%`|C:\Windows
`%TEMP%`|C:\Users\{username}\AppData\Local\Temp
`%TMP%`|C:\Users\{username}\AppData\Local\Temp
`%USERDOMAIN%`|Userdomain associated with current user.
`%USERDOMAIN_ROAMINGPROFILE%`|Userdomain associated with roaming profile.
`%USERNAME%`|{username}
`%USERPROFILE%`|C:\Users\{username}
`%WINDIR%`|C:\Windows
`%PUBLIC%`|C:\Users\Public
`%PSModulePath%`|%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules\
`%OneDrive%`|C:\Users\{username}\OneDrive
`%DriverData%`|C:\Windows\System32\Drivers\DriverData
`%CD%`|Outputs current directory path. (Command Prompt.)
`%CMDCMDLINE%`|Outputs command line used to launch current Command Prompt session. (Command Prompt.)
`%CMDEXTVERSION%`|Outputs the number of current command processor extensions. (Command Prompt.)
`%COMPUTERNAME%`|Outputs the system name.
`%DATE%`|Outputs current date. (Command Prompt.)
`%TIME%`|Outputs time. (Command Prompt.)
`%ERRORLEVEL%`|Outputs the number of defining exit status of previous command. (Command Prompt.)
`%PROCESSOR_IDENTIFIER%`|Outputs processor identifier.
`%PROCESSOR_LEVEL%`|Outputs processor level.
`%PROCESSOR_REVISION%`|Outputs processor revision.
`%NUMBER_OF_PROCESSORS%`|Outputs the number of physical and virtual cores.
`%RANDOM%`|Outputs random number from 0 through 32767.
`%OS%`|Windows_NT


# Microsoft Windows 

## Account

### How to change user account

Let's take a look to how to change user password without any access through Windows ISO.
Boot on Windows 10 ISO
On the language screen, chose your language and hit **SHIFT+F10**

#### 1.1. Get Logical Volume inforations
When the cmd terminal is oppened, list Diske Caption and Volume Name :

```powershell
wmic logicaldisk get caption, VolumeName
```

Move to the Disk you want (letter found with the previous command)

```powershell
d:
```

Go to the system32 folder 

```powershell
cd windows\system32
```

#### Utilman
Use utilman despite off cmd.exe

```powershell
ren utilman.exe utilman.exe.bak
ren cmd.exe utilman.exe
```

Reboot
```powershell
wpeutil reboot
```

### Change user password
After rebooting, clic on accessibility icon

#### Change password
Change the user password

```powershell
Example :
net user admin root

net user $USER pass
```

#### Active user
Active user

```powershell
net user $USER /active:yes
```

Reboot

```powershell
wpeutil reboot
```

Replace utilman despite off cmd.exe

```powershell
ren utilman.exe cmd.exe
ren utilman.exe.bak utilman.exe
```

## Applications
Created Tuesday 25 January 2022

### Google Chrome

#### kiosk mode
Ouvrir une page web avec Google Chrome dans une page détachée: 

```POWERSHELL
Chrome.exe --app=http://
```

### Windows Subsystem Linux

⚠️ This action requires a system restart

How to enable Windows Subsystem for Linux using powershell as **admin** ?

```POWERSHELL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

## Windows Boot

### How to restore Windows 10 MBR

La démarche consiste à remplacer le MBR qui permet d'amorcer GRUB en lui substituant un MBR pointant sur le lanceur de Windows.

Le remplacement du MBR est réalisé à partir du disque de restauration Windows ou du CD d'installation.

Booter depuis le CD d'installation et choisir "Réparer ou récupérer une installation de Windows". 
On sélectionnera ensuite l'installation de Windows dans la liste des choix proposés et on saisira le mot de passe administrateur. 

Au prompt, taper :

```POWERSHELL
C:\WINDOWS> fixboot
C:\WINDOWS> fixmbr
```

La surface disque utilisée par Fedora n'est pas automatiquement ré-allouée . 
C'est l'affaire de fdsik. 

La réallocation consiste en un nouveau formatage, sous le format vfat ou ntfs ou autre, selon le choix - si l'on souhaite ré-allouer les partitions au profit de Windows. On pourra ainsi modifier le format de tout ou partie des partitions et notamment les fusionner. fdisk existe dans l'environnement Windows (ou un programme équivalent).
On redémarrera par la commande :

```POWERSHELL
C:\WINDOWS> exit
```

| Restauration Grub |
|-|
| Si les partitions Linux n'ont pas été ré-allouées, il est toujours possible de restaurer GRUB (et ainsi le boot sur Fedora ou Windows). |

## Storage

### How to change device drive icon ?

Open regedit as administrator :

* Go to ``Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons``
* Create a new key as the correspond lettre of your drive.
* Create a new sub key as ``Defaulticon`` :

    
```POWERSHELL
Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\E   xplorer\DriveIcons\D\Defaulticon
```

Mod the chaine containned in Defaulticon key with the full path of your ``ico`` file.

## System
Here are somes DOS tips & tricks

### Systeminfo

Trouver la date d’installation Windows.

```POWERSHELL
systeminfo | find "installation"
```

Se rendre rapidement sur la page de gestion des software: 
Éxécuter la commande suivante (dans invite de commande ou executer ou menu démarré)

```POWERSHELL
Appwiz.cpl
```

### Hosts file

Hosts file configuration location :

```POWERSHELL
C:\windows\system32\drivers\etc\
```

### Kill task

How to force killing task? 

```POWERSHELL
taskkill /F /IM OpenWith.exe /T
```

### License

Temps restant disponible à la license en cours

```powershell
DISM /online /Get-CurrentEdition
DISM /online /Get-TargetEditions
slmgr.vbs /ipk LICENCE #"Force" || Dism /Online /Set-Edition:ServerDatacenter /AcceptEula /ProductKey:LICENCE
slmgr.vbs /dlv #Check
```

# Windows Updates

## PowerShell

### Install Windows Update

```powershell
Install-Module -Name PSWindowsUpdate
```

### List all Commands

```powershell
Get-Command -module PSWindowsUpdate
```

```powershell
Get-WUInstall
```

# Environment Variables in Windows

## How to use them in PowerShell
Environment Varaibles can be used in PowerShell ([[powershell]]) with the prefix `$env:`.

**Example***:
*Variable:*  `%APPDATA%`
*In Powershell:* `$env:APPDATA`

## List of environment variables
Variable | Description
---|---
`%ALLUSERSPROFILE%`|C:\ProgramData
`%APPDATA%`|C:\Users\{username}\AppData\Roaming
`%COMMONPROGRAMFILES%`|C:\Program Files\Common Files
`%COMMONPROGRAMFILES(x86)%`|C:\Program Files (x86)\Common Files
`%CommonProgramW6432%`|C:\Program Files\Common Files
`%COMSPEC%`|C:\Windows\System32\cmd.exe
`%HOMEDRIVE%`|C:\
`%HOMEPATH%`|C:\Users\{username}
`%LOCALAPPDATA%`|C:\Users\{username}\AppData\Local
`%LOGONSERVER%`|\\{domain_logon_server}
`%PATH%`|C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem
`%PathExt%`|.com;.exe;.bat;.cmd;.vbs;.vbe;.js;.jse;.wsf;.wsh;.msc
`%PROGRAMDATA%`|C:\ProgramData
`%PROGRAMFILES%`|C:\Program Files
`%ProgramW6432%`|C:\Program Files
`%PROGRAMFILES(X86)%`|C:\Program Files (x86)
`%PROMPT%`|$P$G
`%SystemDrive%`|C:
`%SystemRoot%`|C:\Windows
`%TEMP%`|C:\Users\{username}\AppData\Local\Temp
`%TMP%`|C:\Users\{username}\AppData\Local\Temp
`%USERDOMAIN%`|Userdomain associated with current user.
`%USERDOMAIN_ROAMINGPROFILE%`|Userdomain associated with roaming profile.
`%USERNAME%`|{username}
`%USERPROFILE%`|C:\Users\{username}
`%WINDIR%`|C:\Windows
`%PUBLIC%`|C:\Users\Public
`%PSModulePath%`|%SystemRoot%\system32\WindowsPowerShell\v1.0\Modules\
`%OneDrive%`|C:\Users\{username}\OneDrive
`%DriverData%`|C:\Windows\System32\Drivers\DriverData
`%CD%`|Outputs current directory path. (Command Prompt.)
`%CMDCMDLINE%`|Outputs command line used to launch current Command Prompt session. (Command Prompt.)
`%CMDEXTVERSION%`|Outputs the number of current command processor extensions. (Command Prompt.)
`%COMPUTERNAME%`|Outputs the system name.
`%DATE%`|Outputs current date. (Command Prompt.)
`%TIME%`|Outputs time. (Command Prompt.)
`%ERRORLEVEL%`|Outputs the number of defining exit status of previous command. (Command Prompt.)
`%PROCESSOR_IDENTIFIER%`|Outputs processor identifier.
`%PROCESSOR_LEVEL%`|Outputs processor level.
`%PROCESSOR_REVISION%`|Outputs processor revision.
`%NUMBER_OF_PROCESSORS%`|Outputs the number of physical and virtual cores.
`%RANDOM%`|Outputs random number from 0 through 32767.
`%OS%`|Windows_NT
