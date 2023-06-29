# Kubernetes

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

Pierre centrale de K8S
    - ensemble cohérent de conteneurs
    - un ou plusieurs conteneurs
    - une instance de K8S

Un cluster éxecute des pods, mais de quoi s'agit-il ?
Il s'agit d'un ensemble de conteneurs se partageant les ressources.

Lister les pods :

```bash
kubectl get pods
```

Tester les ports :

```bash
kubectl port-forward POD_NAME 8000:80
```

Réccupérer les élèments d'un pod :

```bash
kubectl describe po/POD_NAME
```

## Service

Service : abstraction des pods
    - permet d'éviter la communication par ip (changeante car on est en conteneurs)
    - service > ip/port > pods
    - service = ip et port fixe

Les service exposent les ports d'un pod

## Nodes

Noeuds (serveurs) : physiques ou virtuels
    - master ou simple noeud d'exécution

* Gestion du cluster
* Orchestre l'éxécution des pods sur les noeuds
* Expose l'API server


Que font les Marker ?

* Exécute les pods
* Fournit les ressources aux pods
* Communique avec le master (actions à exécuter ...)


Lister les noeuds : 

```bash
kubectl get nodes
```

## Volumes

Persistents ou non
    - lieux d'échanges entre pods
    - intérieur de pods = non persistent
    - extérieur = persistent


## Deployments

Objets de gestion des déploiments
    - création/suppression
    - scaling : gestion de paramètres pour la montée en charge (ou réduction)

## Namespaces

Cluster virtuel (ensemble de services)
    - sous ensemble pour cloisonner dans K8S