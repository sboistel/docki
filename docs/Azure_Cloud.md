# Microsoft Azure

## Journalisation à l’aide d’Azure CLI

La version actuelle d’Azure CLI ne vous permet pas de gérer la journalisation des applications dans Stockage Blob. 

### Activer

Pour activer la journalisation des applications dans le système de fichiers, exécutez cette commande :

```powershell
az webapp log config --application-logging true --level verbose --name <app-name> --resource-group <resource-group-name>
```

Par exemple, pour activer la journalisation dans le système de fichiers pour une application appelée contosofashions123 en capturant tous les messages, exécutez cette commande.

```powershell
az webapp log config --application-logging true --level verbose --name contosofashions123 --resource-group contosofashionsRG
```

Il n’existe actuellement aucun moyen de désactiver la journalisation des applications à l’aide de commandes Azure CLI.

### Reset

Toutefois, la commande suivante permet de réinitialiser la journalisation dans le système de fichiers au niveau erreur simplement.

```powershell
az webapp log config --application-logging false --name <app-name> --resource-group <resource-group-name>
```

### Status

Pour connaître l’état actuel de la journalisation d’une application, utilisez cette commande.

```powershell
az webapp log show --name <app-name> --resource-group <resource-group-name>
```

