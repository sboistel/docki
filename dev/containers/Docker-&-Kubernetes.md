[[_TOC_]]

---

Here are somes containers tips & tricks

## Docker

Lister les processus en cours :

>    docker ps -a

## Images 

Chaque processus dépendera d'une image pareil à une iso + son appli pour une vm.

Chercher une image :

```BASH
docker search nginx
```

Télécharger une image : 

```BASH
docker pull nginx
```

Lister les images téléchargées :

```BASH
docker images
```

ou

```BASH
docker image ls
```

Supprimer une image :

```BASH
docker rmi nginx
```

:warning: Si une image est sur le disque mais nous est impossible de supprimer (on parlera d'une image souvent testé à l'installation de docker)

Nous allons devoir forcer sa suppression :

```BASH
docker rmi -f hello-world
```

Voir l'historique de son image :

```BASH
docker history sboistel/image:verison(1.1)
```

## Commit

Après avoir fait des changements sur une image, comment enregister tout ça ?

```BASH
docker commit mycentos01 sboistel/mycentos:1.0
```

## DockerFile 

Créer un docker file : ''vim dockerfile''

```YAML
FROM centos
RPM yum install -y wget
RPM yum install yum-utils
```

:warning: Attention, plus il y aura de nombre de ligne dans le dockerfile, plus le nombre de couche sera important et engedra les performences.
    
Construire l'image :
```BASH
docker build -t sboistel/mycentos:1.0
docker build -t mon_image:v1.0
```

### Champs
Liste des différents champs complétable :
- FROM : Pour les images vierge **seuelement** !
- LABEL version : Donner une version
- LABEL description : Décrire la version
- ENV : Variable d'environnement : Example 
   - JAVA_HOME /usr/bin/java
   - ORACLE_HOME /u01/app/oracle/$ORACLE_SID/
- RUN : Commande à effectuer "yum install .."
- WORKDIR : Emplacement de travail
- ...

## Bash
Plusieurs arguments serrons ici utilisés :
- t : Avoir un terminal en sortie
- i : Interactif 

Exemple :

```BASH
docker run -ti ubuntu
```

Exécuter une commande dans l'environnement Bash :

```BASH
docker run -ti ubuntu ps
```

Exécuter une commande dans un conteneur détaché en cours d'éxécution :
```BASH
docker exec -name=container01 -hostname=host01 centos ping 127.0.0.1
```

## Attaché / Non Attaché

Exécuter l'image ubuntu avec des paramètres d'attachements :

```BASH
docker run --name=container01 --hostname=host01 -it ubuntu
```

Exécuter l'image ubuntu avec des paramètres de détachement :

```BASH
docker run -d -it centos ping 127.0.0.1
```

Du coup, où se passes les informations du conteneur détaché ? :

```BASH
docker logs ID_DU_CONTAINER
```

Rappel pour avoir l'id du conteneur : 

```BASH
docker ps 
```

Afin de réccupérer la main sur la session du conteneur détaché :

```BASH
docker attache ID_DU_CONTAINER
```

Revenir au mode détaché, faire la combinaison suivante : ``CTRL + Q ``

## Inspecter un conteneur

Avoir les informations du conteneur en format json :

```BASH
docker inspect container01
```

## Agrégation de recherche
Récolter seulement ce qui nous intérèsse ? 
 - Avoir un status
   ```BASH
   docker inspect --format='{{.State.Status}}' container01
   ```

 - Avoir l'iP du container01 
   ```BASH
   docker inspect --format='{{.NetworkSettings.IPAddress}}' container01
   ```

Réccolter le tableau ''State'' :

```BASH
docker inspect --format='{{json .State}}' container01
```

### Filtres

Filtrer tout les conteneur ayant comme nom web :

```BASH
docker ps -a --filter name=web
```

Filtrer tout les conteneurs ayant un status fermé :

```BASH
docker ps -a --filter status=exited
```


## Formater l'affichage

Formater la sortie :

```BASH
docker ps -a --format "{{.Names}} : {{.Status}}"
```

## Import / Export

### Export

Comment exporter son image ? 

```BASH
docker export -o mycentos01.tar mycentos
```

Vérifier son export :

```BASH
tar tvf mycentos01.tar
```

Tout est ok, je compresse :

```BASH
gzip mycentos01.tar
```

### Import

Comment import une image exportée ? :

```BASH
docker import mycentos.tar.gz mycentos:1.0
```

## Arguments

List d'arguments :
- P : Mapper les ports réseau du conteneur

# Kubernetes

Before :

```BASH
Kubernetes ou K8s (8 étant le nombre de lettre dans Kubernetes)
```

Kubernetes est un **Orchestrateur** (gère des clusters)

Il aura plusieurs notions :
- Gestion des configurations
- Gestion des mots de passe (secrets)
- RBAC (Role base acces controler) "IAM"

## Lexique

- Kubelet : Deamond s'éxécutant dans les workers

## Cluster

Un cluster c'est quoi ?

Un ensemble de noeud de type linux ou windows

## Pods

Un cluster éxecute des pods, mais de quoi s'agit-il ?

Il s'agit d'un ensemble de conteneurs se partageant les ressources.

Lister les pods :

```BASH
kubectl get pods
```

Tester les ports :

```BASH
kubectl port-forward POD_NAME 8000:80
```

Réccupérer les élèments d'un pod :

```BASH
kubectl describe po/POD_NAME
```

## Service

Les service exposent les ports d'un pod

## Nodes

Deux types de noeud :
- Que font les Master ?
   - Gestion du cluster
   - Orchestre l'éxécution des pods sur les noeuds
   - Expose l'API server

- Que font les Marker ?
   - Exécute les pods
   - Fournit les ressources aux pods
   - Communique avec le master (actions à exécuter ...)

Lister les noeuds : 

```BASH
kubectl get nodes
```