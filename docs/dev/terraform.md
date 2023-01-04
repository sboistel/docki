# Terraform
Here are somes tf tips & tricks

## Syntaxe

Travaillons sur un fichier ``main.tf``

## Exemple :


```bash
output "VAR" {
value = "Hello World! "
}
```

#### Sortie :

```bash
Ouptus : 
VAR = Hello World!
```

## tfstate

Le fichier **tfstate** permet de visualiser les actions entreprises (pareil à un fichier de log).
On pourra externaliser (remote state) le fichier tfstate.

### Tester et appliquer


### Tester
Tester les actions à entreprendre :

```bash
terraform plan
```

### Appliquer
Appliquer les modifications souhaitée :

```bash
terraform apply
```