[[_TOC_]]

---

# Activer la journalisation à l’aide d’Azure CLI

La version actuelle d’Azure CLI ne vous permet pas de gérer la journalisation des applications dans Stockage Blob. 

Pour activer la journalisation des applications dans le système de fichiers, exécutez cette commande :

> az webapp log config --application-logging true --level verbose --name <app-name> --resource-group <resource-group-name>

Par exemple, pour activer la journalisation dans le système de fichiers pour une application appelée contosofashions123 en capturant tous les messages, exécutez cette commande.

> az webapp log config --application-logging true --level verbose --name contosofashions123 --resource-group contosofashionsRG

Il n’existe actuellement aucun moyen de désactiver la journalisation des applications à l’aide de commandes Azure CLI.
Toutefois, la commande suivante permet de réinitialiser la journalisation dans le système de fichiers au niveau erreur simplement.

> az webapp log config --application-logging false --name <app-name> --resource-group <resource-group-name>

Pour connaître l’état actuel de la journalisation d’une application, utilisez cette commande.

> az webapp log show --name <app-name> --resource-group <resource-group-name>