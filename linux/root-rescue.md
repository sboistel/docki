# Emergency

## Grub

1. Reach the grub and chose the first line
2. Use 'e' to edit
3. Go to the "vmlinux" line to add '**rd.break'** at the end (This change is temporary)
4. Press 'CTRL+x' to exit an run it

## Rescue

Send a Ctrl+Alt+Del to your system using the relevant button or menu entry.

When the boot-loader menu appears, press any key to interrupt the countdown, except Enter.

Use the cursor keys to highlight the default boot loader entry.

Press e to edit the current entry.

Use the cursor keys to navigate to the line that starts with linux.

Press End to move the cursor to the end of the line.

Append *rd.break* to the end of the line.

Press Ctrl+x to boot using the modified configuration.

At the switch_root prompt, remount the /sysroot file system read/write, then use chroot to go into a chroot jail at /sysroot.

```shell
switch_root:/# mount -o remount,rw /sysroot
switch_root:/# chroot /sysroot
```

Set the root password to redhat.

```shell
sh-4.4# passwd root
Changing password for user root.
New password: redhat
BAD PASSWORD: The password is shorter than 8 characters
Retype new password: redhat
passwd: all authentication tokens updated successfully.
```

Configure the system to automatically perform a full SELinux relabel after boot.

```shell
sh-4.4# touch /.autorelabel
```

Type exit twice to continue booting your system. The system fails to boot because of an issue you resolve in the next step. 

### Selinux

⚠ Make sure SELinux allows the file changed

> touch .autorelabel

*This will signal SELinux on the next reboot that the filesystem has changed (the changed password) and allow the change to be loaded.*

Type 'exit' then 'reboot'
