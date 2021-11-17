# Ansible

# → [Lexique](lexique.md)

## Pense bête

List d'argument :

 -i : Spécifier le fichier d'inventaire

 -C,--check : Vérifier la.es action.s qui sera.ont réalisée.s

 -m : Spécifier le module que l'on souhaite invoquer

 -k : Demander le mot de passe **user**

 -K : Demander le mot de passe **root**

 -b,--become : Éxécuter en tant que **su** (*admin)

# Configuration

## Main configuration file

Ansible.cfg

```bash
[defaults]
host_key_checking = False
inventory = pve.inventory
```

## Inventory

Inventoy

```bash
# Section Name
[Section]
ansible_user = John Doe
ansible_password = jdoe
```