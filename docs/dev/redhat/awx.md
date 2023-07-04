# AWX

## Installation

### Kubernetes

#### Minikube

First, update your system and install one of these alternative drivers (for me side docker):

    ▪ docker: Not installed: exec: "docker": executable file not found in $PATH
    ▪ kvm2: Not installed: exec: "virsh": executable file not found in $PATH
    ▪ podman: Not installed: exec: "podman": executable file not found in $PATH
    ▪ qemu2: Not installed: exec: "qemu-system-x86_64": executable file not found in $PATH
    ▪ virtualbox: Not installed: unable to find VBoxManage in $PATH

Download the latest installation file :

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

source [minikube start](https://minikube.sigs.k8s.io/docs/start/)

And install it

```bash
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Run now minikube

```bash title="minikube start"
😄  minikube v1.30.1 on Rocky 8.8 (kvm/amd64)
✨  Automatically selected the podman driver. Other choices: none, ssh
📌  Using Podman driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.26.3 preload ...
    > preloaded-images-k8s-v18-v1...:  397.02 MiB / 397.02 MiB  100.00% 39.37 M
    > gcr.io/k8s-minikube/kicbase...:  373.53 MiB / 373.53 MiB  100.00% 15.65 M
🔥  Creating podman container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.26.3 on Docker 23.0.2 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🔎  Verifying Kubernetes components...
🌟  Enabled addons: default-storageclass, storage-provisioner
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

To avoid of always prompt `minikube` infront of any command :

```bash
echo 'alias kubectl="minikube kubectl --"' >> .bashrc
source .bashrc
```

#### Configuration

```yaml title="kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  # Find the latest tag here: https://github.com/ansible/awx-operator/releases
  - github.com/ansible/awx-operator/config/default?ref=<tag>

# Set the image tags to match the git version from above
images:
  - name: quay.io/ansible/awx-operator
    newTag: <tag>

# Specify a custom namespace in which to install AWX
namespace: awx
```

Then build it

!!! info

    Verify that git is installed.

```bash
kubectl apply -k .
```

Now create `awx` file :

```yaml title="awx.yaml"
---
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx-NAME
spec:
  service_type: nodeport
  nodeport_port: 30080
```

Add this file into the **resources** section of the kustomization file.

```yaml
...
resources:
  - github.com/ansible/awx-operator/config/default?ref=<tag>
  # Add this extra line:
  - awx-NAME.yaml
...
```

Then rebuild

Get logs :

```bash
kubectl logs -f deployments/awx-operator-controller-manager -n awx
```

---

=== "C"
  
  ``` c
  #include <stdio.h>

  int main(void) {
    printf("Hello world!\n");
    return 0;
  }
  ```

=== "C++"
  
  ``` c++
  #include <iostream>

  int main(void) {
    std::cout << "Hello world!" << std::endl;
    return 0;
  }
  ```
---
=== "Unordered list"

    * Sed sagittis eleifend rutrum
    * Donec vitae suscipit est
    * Nulla tempor lobortis orci

=== "Ordered list"

    1. Sed sagittis eleifend rutrum
    2. Donec vitae suscipit est
    3. Nulla tempor lobortis orci
---
!!! example

    === "Unordered List"

        ``` markdown
        * Sed sagittis eleifend rutrum
        * Donec vitae suscipit est
        * Nulla tempor lobortis orci
        ```

    === "Ordered List"

        ``` markdown
        1. Sed sagittis eleifend rutrum
        2. Donec vitae suscipit est
        3. Nulla tempor lobortis orci
        ```
---

AWX install by docker

sudo apt update -y && sudo apt upgrade -y

sudo apt install curl wget unzip -y

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt install software-properties-common git gnupg2 ansible npm nodejs docker-ce docker-ce-cli containerd.io python3-pip git pwgen -y

sudo gpasswd -a lully docker

docker ps -a

sudo systemctl enable docker

sudo apt install docker-compose -y

docker-compose --version

npm install npm --global

sudo npm install npm --global

pip3 install docker-compose==1.25.0

wget https://github.com/ansible/awx/archive/17.0.1.zip

sudo apt install unzip

unzip 17.0.1.zip

cd awx-17.0.1/installer/

pwgen -N 1 -s 30 > ~/password


vim inventory

 admin_user=lully
 admin_password=joepassword
 secret_key=CkuLOxvgiCzpeLrBLW5UZFkkEiG7NR

sudo ansible-playbook -i inventory install.yml