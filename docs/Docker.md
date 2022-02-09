# Docker
Here are somes containers tips & tricks

Arguments
=========
List d'arguments :

* P : Mapper les ports réseau du conteneur


Containers
==========
Here are somes container tips & tricks

Qu'est-ce que la conteneurisation ?
-----------------------------------

L'objectif de la conteneurisation est de faire en sorte qu'un ensemble logiciel cohérent puisse fonctionner au sein d'un conteneur.

Pour qu'une application puisse tourner au sein d'un conteneur, elle doit être empaquetée, c'est à dire qu'on la met à l'intérieur d'un paquet (une image dans la terminologie des conteneurs) avec ses dépendances. 

Il existe d'ailleurs des images officielles, sur le Hub Docker par exemple, permettant de faire tourner tout type de logiciel (MySQL, Java 8, wordpresse, etc).

Type de système
===============

Il y a plusieurs type de système de conteneurisation.
Dotcloud plus connu sous le nom de Docker sera de moins en moins utilisé car tant à le déprécier.

On trouvera aussi :

* CoreOS
* Mesos
* LXC
* OpenVZ
* Containerd
* etc ...


Docker
======

Lister les processus en cours :
>    docker ps -a

Images
------

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

⚠ Si une image est sur le disque mais nous est impossible de supprimer (on parlera d'une image souvent testé à l'installation de docker)
Nous allons devoir forcer sa suppression :

```BASH
docker rmi -f hello-world
```

Voir l'historique de son image :

```BASH
docker history sboistel/image:verison(1.1)
```

Commit
======

Après avoir fait des changements sur une image, comment enregister tout ça ?

```BASH
docker commit mycentos01 sboistel/mycentos:1.0
```

DockerFile
==========

Créer un docker file : vim dockerfile

```YAML
FROM centos
RPM yum install -y wget
RPM yum install yum-utils
```

⚠ Attention, plus il y aura de nombre de ligne dans le dockerfile, plus le nombre de couche sera important et engedra les performences.
Construire l'image :

```BASH
docker build -t sboistel/mycentos:1.0
docker build -t mon_image:v1.0
```

Champs
------
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


bash
====
Plusieurs arguments serrons ici utilisés :

* t : Avoir un terminal en sortie
* i : Interactif 


### Exemple :

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

Attaché / Non Attaché
=====================
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

Inspecter un conteneur
======================
Avoir les informations du conteneur en format json :

```BASH
docker inspect container01
```

Agrégation de recherche
=======================
Récolter seulement ce qui nous intérèsse ? 
 - Avoir un status
   ```BASH
   docker inspect --format='![](./Docker/.State.Status)' container01
   ```

 - Avoir l'iP du container01 
   ```BASH
   docker inspect --format='![](./Docker/.NetworkSettings.IPAddress)' container01
   ```

Réccolter le tableau State :

```BASH
docker inspect --format='![](./Docker/json .State)' container01
```

Filtres
-------
Filtrer tout les conteneur ayant comme nom web :

```BASH
docker ps -a --filter name=web
```

Filtrer tout les conteneurs ayant un status fermé :

```BASH
docker ps -a --filter status=exited
```


Formater l'affichage
====================
Formater la sortie :

```BASH
docker ps -a --format "![](./Docker/.Names) : ![](./Docker/.Status)"
```

Import / Export
===============

Export
------
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



