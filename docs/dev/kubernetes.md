# Kubernetes
Created Tuesday 25 January 2022

Kubernetes ou K8s (8 étant le nombre de lettre dans Kubernetes)

Kubernetes est un **Orchestrateur** (gère des clusters)

Il aura plusieurs notions :
- Gestion des configurations
- Gestion des mots de passe (secrets)
- RBAC (Role base acces controler) "IAM"

## Lexique


* Kubelet : Deamond s'éxécutant dans les workers


## Cluster

Un cluster c'est quoi ?
Un ensemble de noeud de type linux ou windows

### Pods

Un cluster éxecute des pods, mais de quoi s'agit-il ?
Il s'agit d'un ensemble de conteneurs se partageant les ressources.

Lister les pods :

```BASH
kubectl get pods
```

Tester les ports :

```BASH
kubectl port-forward POD_NAME 8000:80
```

Réccupérer les élèments d'un pod :

```BASH
kubectl describe po/POD_NAME
```

## Service

Les service exposent les ports d'un pod

## Nodes

Deux types de noeud :
Que font les Master ?

* Gestion du cluster
* Orchestre l'éxécution des pods sur les noeuds
* Expose l'API server


Que font les Marker ?

* Exécute les pods
* Fournit les ressources aux pods
* Communique avec le master (actions à exécuter ...)


Lister les noeuds : 

```BASH
kubectl get nodes
```

