# AWX

## Installation


## Configuration

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