# Account

## How to change user account

Let's take a look to how to change user password without any access through Windows ISO.
Boot on Windows 10 ISO
On the language screen, chose your language and hit **SHIFT+F10**

## Get Logical Volume inforations

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

## Utilman

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

### Change password

Change the user password

```powershell
Example :
net user admin root

net user $USER pass
```

### Active user

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