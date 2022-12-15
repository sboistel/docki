# Centreon Central
Here are somes Centreon tips & tricks

## Analyse

Vérifier les connexions tentées :

```BASH
/var/log/centreon/login.log
```

## Poller

List storage from poller :

```BASH
/usr/lib/centreon/plugins/centreon-plugins/centreon_plugins.pl --plugin=os::linux::snmp::plugin --mode=list-storages --hostname=$HOST | grep /
```

### Stats

Voir les stats du poller :

```BASH
/usr/sbin/centenginestats
```

| Répertoire du log                                        |
|----------------------------------------------------------|
| ```tail -f /var/log/centreon-broker/poller-module.log``` |


### Yellow state
Last update yellow ?
Lors d'une migration de poller, s'assurer que l'adresse du central soit bien mensionnée dans le broker du poller.

## Commandes

Liste de commandes centreons à garder en tête

## Plugin

Commande du plugin centreon :

```BASH
/usr/lib/centreon/plugins/centreon-plugins/centreon_plugins.pl
```

Lister les FS :
On va utiliser le mode **list-storages** :

```BASH
/usr/lib/centreon/plugins/centreon-plugins/centreon_plugins.pl --plugin=os::linux::snmp::plugin --mode=list-storages --hostname=${iP}
```

