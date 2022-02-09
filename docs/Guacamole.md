# Guacamole
Apache Guacamole is a clientless remote desktop gateway. 
It supports standard protocols like VNC, RDP, and SSH.


We call it clientless because no plugins or client software are required.
Thanks to HTML5, once Guacamole is installed on a server, **all you need to access your desktops is a web browser**.

Server
------

### Requiere depedences

#### APT:DEB/Ubuntu
```bash
apt install libcairo2-dev libtool-bin libossp-uuid-dev
```

#### Optional depedences

* APT:DEB/Ubuntu

```bash
apt install libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev  libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev
```

#### Obtain code

* APT:DEB/Ubuntu

```bash
apt install git
```

Donwload the guacamole server repository:
```bash
git clone <git://github.com/apache/guacamole-server.git>
```

### Build process

```bash
cd guacamole-server
autoreconf -fi
```

```bash
./configure --with-init-dir=/etc/init.d --enable-allow-freerdp-snapshots
make
```

### Installation
```bash
make install
ldconfig
```

Guest agent
-----------

### Requierement


* APT:DEB/Ubuntu

```bash
apt install git maven 
```


* RPM:Fedora/Centos/Rhel:

```bash
yum install git maven 
```

Donwload the guacamole client repository
```bash
git clone <git://github.com/apache/guacamole-client.git>
mvn package
```

---

Source : <https://kifarunix.com/install-apache-guacamole-on-ubuntu-21-04/>

Server Installation
-------------------

Update :
```bash
apt update
```

Software needed :
```bash
apt install build-essential libcairo2-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libtelnet-dev libssl-dev libvorbis-dev libwebp-dev
```

---

Guacamole Server
----------------

### Downlaod
```bash
cd /usr/src/
wget <https://downloads.apache.org/guacamole/1.3.0/source/guacamole-server-1.3.0.tar.gz>
tar xzvf guacamole-server-1.3.0.tar.gz
```

### Configuration
For more configure options, run, `./configure --help`

#### Verifying if anything is missing
```bash
cd guacamole-server-1.3.0
./configure --with-init-dir=/etc/init.d
```

