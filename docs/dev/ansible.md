# Ansible Engine

## List d'argument

* -i : Spécifier le fichier d'inventaire
* -C,--check : Vérifier la.es action.s qui sera.ont réalisée.s
* -m : Spécifier le module que l'on souhaite invoquer
* -k : Demander le mot de passe **user**
* -K : Demander le mot de passe **root**
* -b,--become : Éxécuter en tant que **su** (*admin)

## Configuration

### ansible

file : `ansible.cgf`

```bash
host_key_checking = False
inventory = pve.inventory
```

### Inventory

file : `inventory`

```bash
[Groups]
ansible ansible_hosts=iP

[Groups:vars]
ansible_user = John Doe
ansible_password = jdoe
```
