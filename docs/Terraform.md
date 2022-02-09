# Terraform
Here are somes tf tips & tricks

Syntaxe
=======
Travaillons sur un fichier ``main.tf``

Exemple :
---------

```BASH
output "VAR" {
value = "Hello World! "
}
```

#### Sortie :

```BASH
Ouptus : 
VAR = Hello World!
```

tfstate
=======
Le fichier **tfstate** permet de visualiser les actions entreprises (pareil à un fichier de log).
On pourra externaliser (remote state) le fichier tfstate.

Tester et appliquer
-------------------

### Tester
Tester les actions à entreprendre :

```BASH
terraform plan
```

### Appliquer
Appliquer les modifications souhaitée :

```BASH
terraform apply
```

