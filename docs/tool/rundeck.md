# Rundeck

Rundeck is runbook automation that gives you and your colleagues self-service access to the processes and tools they need to get their job done.

## Installation

### Ubuntu or Debian disto

**Community version**

#### Java

!!! WARNING

	Rundeck depends on **Java 11** or **Java 8**. The **Java 14** packages will satisfy this dependency however Rundeck will not function properly with them. It is recommended to install the `openjdk-11-jre-headless` package manually.

```bash
sudo apt-get install openjdk-11-jre-headless
```

#### Quick installation

```bash
curl https://raw.githubusercontent.com/rundeck/packaging/main/scripts/deb-setup.sh 2> /dev/null | sudo bash -s rundeck
```

#### Manual installation

Bring signed keys :

```bash
curl -L https://packages.rundeck.com/pagerduty/rundeck/gpgkey | sudo apt-key add -
```

Create new sources list  `/etc/apt/sources.list.d/rundeck.list` :

```bash
deb https://packages.rundeck.com/pagerduty/rundeck/any/ any main
deb-src https://packages.rundeck.com/pagerduty/rundeck/any/ any main
```

Now, lets install

Download package if relavant from the [download page](https://www.rundeck.com/downloads)

```bash
sudo apt update
sudo apt install rundeck
```

### Post Installation

#### URL ?

Change the URL into the `/etc/rundeck` directory <br>
*> might be run as root*

Replace the **10..x** by your **iP**

```bash
sed -i 's/localhost/10..x/g' rundeck-config.properties framework.properties
```

#### Service

Enable the `rundeckd` service

```bash
sudo systemctl enable rundeckd
```

Start the `rundeckd` service

```bash
sudo systemctl start rundeckd
```

To verify that the service started correctly, tail the logs:

```bash
tail -f /var/log/rundeck/service.log
```

Copied!

The service is ready once you see something similar to:

```bash
Grails application running at http://localhost:4440 in environment: production
```

*Yes there is locahost in the log I know ...*

#### Logging in for the first time

1. Navigate to [http://localhost:4440/ (opens new window)](http://localhost:4440/)in a browser.
2. Log in with the username **admin** and password **admin**

Rundeck is now up and running !
