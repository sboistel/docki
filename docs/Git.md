# Git
Here are somes git tips & tricks

Config
======

Username
--------
Ajout le nom d'utilisateur au profil 
> git config --global user.name "sboistel"

Mail
----
Ajout le mail du profil 
> git config --global user.email "[sboistel@mail.com](mailto:sboistel@mail.com)"

Credentials
-----------
Garder en mémoire les données de connexion au repo : 
> git config credential.helper store

Branches
========
Lister les Branches 
> git branche

Checkout
--------
Vérifier quel est la branche sur laquelle nous sommes:
> git checkout

Changer de branche : 
> git checkout nom_branche

Manage
======

### Push
Push vers vers une autre branche que Master :
> git push -u origin nom_branche

### Merge
Se positionner sur la branche master (principale..), et ensuite
> git merge nom_branche

Ne pas omettre de push ensuite ;) 
> git push

### Stash
Le stash permet de garder les modifications faites en local sans les propager.
On pourra vérifier ce qu'il est possible de save :
> git stash list

Clear la liste stash 
> git stash clear

Commiter un stash 
> git stash pop

