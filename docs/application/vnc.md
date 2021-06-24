# VNC Server

# Index

* [VNC Session](#vnc-session)
   * [Change the VNCpassword](#change-the-vncpassword)
   * [Directory](#directory)
   * [Session file](#session-file)
   * [Service](#service)

# VNC Session
How to create new VNC Session ?

## Change the VNCpassword
```bash
vncpassword
```

## Directory
Move to the session direcotry :

```bash
cd /etc/systemd/system
```

## Session file
Copy old vncserver.service file to a new one :
```bash
cp vncserver@{N°}.service vncserver@:{New N°}.service
```

Replace
```bash
sed -i 's/olduser/newuser/g' vncserver@:{New N°}.service
```
## Service
Enable the service :
```bash
systemctl enable vncserver@:{New N°}.service
```