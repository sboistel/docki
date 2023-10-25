# Docker

Lister les processus en cours :
> docker ps -a

## Images

Chaque processus dépendera d'une image pareil à une iso + son appli pour une vm.
Chercher une image :

```bash
docker search nginx
```

Télécharger une image : 

```bash
docker pull nginx
```

Lister les images téléchargées :

```bash
docker images
```

ou

```bash
docker image ls
```

Supprimer une image :

```bash
docker rmi nginx
```

⚠ Si une image est sur le disque mais nous est impossible de supprimer (on parlera d'une image souvent testé à l'installation de docker)
Nous allons devoir forcer sa suppression :

```bash
docker rmi -f hello-world
```

Voir l'historique de son image :

```bash
docker history sboistel/image:verison(1.1)
```

## Commit

Après avoir fait des changements sur une image, comment enregister tout ça ?

```bash
docker commit mycentos01 sboistel/mycentos:1.0
```

## DockerFile

Créer un docker file : `vim dockerfile`

```yml
FROM centos
RPM yum install -y wget
RPM yum install yum-utils
```

!!! warning
	Plus il y aura de nombre de ligne dans le dockerfile, plus le nombre de couche sera important et engedra les performences.

Construire l'image :

```bash
docker build -t sboistel/mycentos:1.0
docker build -t mon_image:v1.0
```

### Champs

Liste des différents champs complétable :

* FROM : Pour les images vierge seuelement !
* LABEL version : Donner une version
* LABEL description : Décrire la version
* ENV : Variable d'environnement : Example 
	* JAVA_HOME [/usr/bin/java](file:///home/sboistel/Documents/Cliford/Zbook/usr/bin/java)
	* ORACLE_HOME /u01/app/oracle/$ORACLE_SID/
* RUN : Commande à effectuer "yum install .."
* WORKDIR : Emplacement de travail
* ...

## Run / Exec

Plusieurs arguments serrons ici utilisés :

* t : Avoir un terminal en sortie
* i : Interactif 

### Exemple :

```bash
docker run -ti ubuntu
```

Exécuter une commande dans l'environnement Bash :

```bash
docker run -ti ubuntu ps
```

Exécuter une commande dans un conteneur détaché en cours d'éxécution :

```bash
docker exec -name=container01 -hostname=host01 centos ping 127.0.0.1
```

## Attaché / Non Attaché

Exécuter l'image ubuntu avec des paramètres d'attachements :

```bash
docker run --name=container01 --hostname=host01 -it ubuntu
```

Exécuter l'image ubuntu avec des paramètres de détachement :

```bash
docker run -d -it centos ping 127.0.0.1
```

Du coup, où se passes les informations du conteneur détaché ? :

```bash
docker logs ID_DU_CONTAINER
```

Rappel pour avoir l'id du conteneur : 

```bash
docker ps 
```

Afin de réccupérer la main sur la session du conteneur détaché :

```bash
docker attache ID_DU_CONTAINER
```

Revenir au mode détaché, faire la combinaison suivante : ``CTRL + Q ``

## Inspecter un conteneur

Avoir les informations du conteneur en format json :

```bash
docker inspect container01
```

## Agrégation de recherche

Récolter seulement ce qui nous intérèsse ?

* Avoir un status

```bash
docker inspect --format='![](./Docker/.State.Status)' container01
```

* Avoir l'iP du container01 

```bash
docker inspect --format='![](./Docker/.NetworkSettings.IPAddress)' container01
```

Réccolter le tableau State :

```bash
docker inspect --format='![](./Docker/json .State)' container01
```

### Filtres

Filtrer tout les conteneur ayant comme nom web :

```bash
docker ps -a --filter name=web
```

Filtrer tout les conteneurs ayant un status fermé :

```bash
docker ps -a --filter status=exited
```


## Formater l'affichage

Formater la sortie :

```bash
docker ps -a --format "![](./Docker/.Names) : ![](./Docker/.Status)"
```

## Import / Export

### Export

Comment exporter son image ?

```bash
docker export -o mycentos01.tar mycentos
```

Vérifier son export :

```bash
tar tvf mycentos01.tar
```

Tout est ok, je compresse :

```bash
gzip mycentos01.tar
```

#### Import
Comment import une image exportée ? :

```bash
docker import mycentos.tar.gz mycentos:1.0
```

## Containers

L'objectif de la conteneurisation est de faire en sorte qu'un ensemble logiciel cohérent puisse fonctionner au sein d'un conteneur.

Pour qu'une application puisse tourner au sein d'un conteneur, elle doit être empaquetée, c'est à dire qu'on la met à l'intérieur d'un paquet (une image dans la terminologie des conteneurs) avec ses dépendances. 

Il existe d'ailleurs des images officielles, sur le Hub Docker par exemple, permettant de faire tourner tout type de logiciel (MySQL, Java 8, wordpresse, etc).

## Type de système

Il y a plusieurs type de système de conteneurisation.
Dotcloud plus connu sous le nom de Docker sera de moins en moins utilisé car tant à le déprécier.

On trouvera aussi :

* CoreOS
* Mesos
* LXC
* OpenVZ
* Containerd
* etc ...

## Dockerless

```bash
================================================================================

To run Docker as a non-privileged user, consider setting up the
Docker daemon in rootless mode for your user:

    dockerd-rootless-setuptool.sh install

Visit https://docs.docker.com/go/rootless/ to learn about rootless mode.


To run the Docker daemon as a fully privileged service, but granting non-root
users access, refer to https://docs.docker.com/go/daemon-access/

WARNING: Access to the remote API on a privileged Docker daemon is equivalent
         to root access on the host. Refer to the 'Docker daemon attack surface'
         documentation for details: https://docs.docker.com/go/attack-surface/

================================================================================
```
