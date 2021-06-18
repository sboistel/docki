# Analyse

# Index

# Load

## SAR

On trouvera les fichier de log de l'outil **sysstat** dans : ``/var/log/sysstat/``
Chacun des fichier dans ce dossier sera normé par ``sa$JOUR_DU_MOIS``.

Liste des paramètres :
- S : swap
- r : RAM
- R : Caches
- u : Utilisateur

# Connection

## User

Check last user connection :

```bash
last -15 -aFw
```

For DEB packages only :

```bash
cat /var/log/auth.log
```