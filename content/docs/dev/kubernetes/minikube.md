---
title: "Minikube"
description: "Minikube est un outil qui facilite l'exécution de Kubernetes localement."
tags: ["kubernetes", "minikube", "local"]
---

First, update your system and install one of these alternative drivers (for me side docker):

* **docker**: Not installed: exec: "`docker`": executable file not found in **$PATH**
* **kvm2**: Not installed: exec: "`virsh`": executable file not found in **$PATH**
* **podman**: Not installed: exec: "`podman`": executable file not found in **$PATH**
* **qemu2**: Not installed: exec: "`qemu-system-x86_64`": executable file not found in **$PATH**
* **virtualbox**: Not installed: unable to find "`VBoxManage`" in **$PATH**

Download the latest installation file :

```bash {filename="minikube-linux-amd64"}
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

source [minikube start](https://minikube.sigs.k8s.io/docs/start/)

And install it

```bash
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Run now minikube

```bash {filename="minikube start"}
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
