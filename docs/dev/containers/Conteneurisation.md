# Containers

Here are somes container tips & tricks

## Qu'est-ce que la conteneurisation ?

L'objectif de la conteneurisation est de faire en sorte qu'un ensemble logiciel cohérent puisse fonctionner au sein d'un **conteneur**.

Pour qu'une application puisse tourner au sein d'un conteneur, elle doit être **empaquetée**, c'est à dire qu'on la met à l'intérieur d'un paquet (une image dans la terminologie des conteneurs) avec ses dépendances. 

Il existe d'ailleurs des images officielles, sur le Hub Docker par exemple, permettant de faire tourner tout type de logiciel (MySQL, Java 8, wordpresse, etc).

## Type de système

Il y a plusieurs type de système de conteneurisation.

Dotcloud plus connu sous le nom de Docker sera de moins en moins utilisé car tant à le déprécier.

On trouvera aussi :
- CoreOS
- Mesos
- LXC
- OpenVZ
- Containerd
- etc ...