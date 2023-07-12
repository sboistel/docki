# Process

Lister tout les processus :

* a : Ayant un terminal de contrôle
* u : Lancés par l'/es utilisateur(s)
* x : N'ayant pas de terminal de contrôle (TTY)
* e : Tout les processe
* d : Tout les processes sauf ceux de la session courante
* l : Liste longue
* f : Full -> Avoir le nom complet du processus

## CPU

Lister le nombre de processeur :

```bash
nproc
```

### Load

Check the load average fixed by the system:
> cat /proc/loadavg

Verify time since the system is up:

```bash
uptime
```

You could check your system processes by top/htop or glances and more one else:

```bash
top
```

You can folow your CPU in real time by this command:

```bash
vmstat -w 1
```
