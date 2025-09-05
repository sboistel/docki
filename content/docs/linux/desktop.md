---
title: "Desktop Environment"
description: "Tips and tricks for managing your desktop environment"
tags: ["linux", "desktop", "gnome"]
---


Here are some Desktop Environment tips & tricks

## Gnome

### Add an application to Gnome Shell

Add a .desktop file in /usr/share/applications/MYAPP.desktop:

```shell
[Desktop Entry]
Name=MyApp
Comment=Application description
Exec=MyApp.sh %U
Icon=/usr/share/icons/myapp.svg
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Network;Application
```

#### Edit an existing application

Find the application's .desktop file, here `VirtualBox`

A known issue with Gnome and VirtualBox is a broken interface. You can fix this by changing the style using the command:

```shell
VirtualBox -style Adwaita
```

Then edit the file `/usr/share/applications/virtualbox.desktop`
Replace line 10 `Exec=VirtualBox %U` with `Exec=VirtualBox -style Adwaita`.

## Desktop Manager

## Lightdm

### Autologin

Edit the following configuration file: ``/etc/lightdm/lightdm.conf``
Fill in the required information:

```shell
autologin-user=jdoe
```
