[[_TOC_]]

---

Here are somes Oracle tips & tricks

## Spfile

SPFILE (Fichier de paramètres persistant) est un fichier binaire recherché automatiquement au démarrage de l’instance.

Son nom par défaut est spfile<SID>.ora.

Il est situé dans $ORACLE_HOME/dbs/.

Le fichier SPFILE est recommandé par Oracle en raison de la possibilité de géré dynamiquement de nombreux paramètres d’initialisation. Il est modifié par le moteur Oracle.

PFILE (Fichier de paramètres statique) est un fichier texte recherché automatiquement au démarrage de l’instance en l’absence du fichier SPFILE.

Il est modifié manuellement par le DBA.

Son nom par défaut est : init<SID>.ora et il est situé dans $ORACLE_HOME/dbs.

Les modifications prennent effet qu’après le redémarrage de l’instance.

CRÉER UN SPFILE A PARTIR D’UN PFILE
Vous pouvez créer un fichier SPFILE à partir d’un fichier PFILE via la commande suivante (instance démarrée ou non) et ou le nom d’instance est DBA01 : 

```SQL
    CREATE SPFILE = ‘$ORACLE_HOME/dbs/spfileDBA01.ora’ FROM PFILE = ‘$ORACLE_HOME/dbs/initDBA01.ora‘
```

## Control file

Le fichier de contrôle est un fichier binaire, il contient des informations sur la structure physique de la base. Il est créé pendant la création de la base et il est modifié en permanence.

Ce fichier doit être toujours disponible car il est consulté; et modifié fréquemment par le serveur oracle. Et il est indispensable pour la restauration de la base.

Pour afficher les noms des fichiers de contrôle on utilise :

```SQL
    SHOW PARAMETER CONTROL_FILES
    SELECT VALUE FROM V$PARAMETER WHERE NAME='control_files';
```

## Redolog

Les fichiers Redo Logs servent à enregistrer toutes les modifications commitées effectuées sur le base de données.

Ils servent à protéger la base de données dans le cas d’un échec d’instance.

En cas de restauration de la base de données, on utilise les redo logs pour ‘rejouer’ les modifications qui ont eu lieu, les transactions validées (commit à la fin de la transaction) sont enregistrées dans les fichiers de données Oracle et les transactions non validées, s’il y en a, sont effacées des fichiers de données.

## Data base file

Les fichiers physiques d’une base Oracle permettent de stocker de manière persistante les données manipulées par Oracle.

## Archive log

Quand la base est en mode NOARCHIVELOG, l’archivage des fichiers redo est désactivé.

Le fichier de contrôle indique que les groupes des fichiers redo pleins ne sont plus nécessaires.

Dès qu’ils sont inactifs après un log switch, le groupe sera disponible pour une réutilisation par la LGWR . → (lgwr écrit toutes les entrées refaites qui ont été copiées dans le tampon depuis la dernière fois.)

Le mode NOARCHIVELOG protège la base contre une défaillance d’instance et non pas contre une défaillance media.

Seulement les modifications récentes dans la base, stockés dans les groupes de fichiers redo en ligne seront disponibles pour la restauration de la base.

En mode NOARCHIVELOG, on ne peut pas sauvegarder en ligne une tablespace. Pour restaurer une base en mode NOARCHIVELOG, on est obligé de faire une sauvegarde complète quand la base est fermée.

Quand la base est en mode ARCHIVELOG, l’archivage des fichiers redo est activé.

Le fichier de contrôle de la base signale que les groupes contenant des fichiers redo pleins ne peuvent pas être utilisés par le process LGWR tant que les groupes n’ont pas été archivés.

Vérifier s’il y a présence d’Archive log :

```SQL 
archive log list
```

Connaître la destination de chacune d’entre-elles :

```SQL
show parameter log_archive_dest
```

Passer en mode d'archivage (//attention à ne pas omettre de monter seulement l'instance afin d'effectuer la manipulation. Celle-ci subira donc une **relance**//) :

```SQL
ALTER DATABASE ARCHIVELOG;
```

## Informations

Connaître les informations et version de composant oracle :

```SQL
odacli describe-component
```

Connaître le nom de la base sur laquelle on est connectée :

```SQL
show parameter name
```

Ou encore pour soucis de sureté :

```SQL
show parameter unique
```

Connaître le owner d’une table :
```SQL
select disctinct owner from all_tables;
```

Savoir si la base tourne ou non en SQL :
```SQL
SELECT INSTANCE_NAME, STATUS, DATABASE_STATUS FROM V$INSTANCE;
```

## Diag Tunning

|Name||
|-|-|
| Interpréter | Syntaxe : ``` CONTROL_MANAGEMENT_PACK_ACCESS = { NONE | DIAGNOSTIC | DIAGNOSTIC+TUNING} ``` |
| Désactiver | Passon la mémoire tampon mais aussi le spfile à none |


En tant que sysdba :

```SQL
ALTER SYSTEM SET CONTROL_MANAGEMENT_PACK_ACCESS=NONE SCOPE=BOTH;
```

### Check

- Vérifier s’il est activé :

```SQL
show parameter control_management_pack_access
```

- Ou encore :

```SQL
select display_value from v$parameter where name = 'control_management_pack_access';
```

## Bring impdp

Réccupérer la vue sur un import en bacground :

```SQL
impdp \"/ as sysdba\" ATTACH="SYS_IMPORT_FULL_01"
```

## Global Prefs

Get Global prefs :

```SQL
SELECT DBMS_STATS.get_prefs('CONCURRENT') FROM dual;
```

|Global Perfs State|SQL Command|
|-|-|
|True| ``` DBMS_STATS.SET_GLOBAL_PREFS('CONCURRENT','TRUE'); ``` |
|False| ``` DBMS_STATS.SET_GLOBAL_PREFS('CONCURRENT','FALSE'); ``` |

## LSNRCTL

L’utilitaire de contrôle d’écoute vous permet d’administrer des listeners.

Vous pouvez utiliser ses commandes pour exécuter des fonctions de gestion de base sur un ou plusieurs listeners.

En outre, vous pouvez afficher et modifier les paramètres.

Commandes possible :
- start  
- Stop
- Status
- Services
- Servacls
- Version
- Reload
- save_config
- Trace
- Spawn
- Quit
- Exit
- set*
- show*

Effectuer un status du service listener : 

Il se peut que celuic-ci ne se nomme pas LISTENER, il s’agit des paramètres pas défaut :

> lsnrctl status LISTENER

## ODACLI

Répertorier toutes les bases de données de l’appliance :

> odacli list-databases

Afficher les détails de la base de données :

> odacli describe-database

Créer une nouvelle base de données :

> odacli create-database

Supprimer une base de données :

> odacli delete-database

Réseau :
 - On trouvera les identifiants réseau :

    > odacli list-network

 - On y trouve tout les détails de ce réseau : ::

    > odacli describe-ntwork -i $identifiants_réseau

## OSWBBA

```JAVA 
java -jar /opt/oracle/oak/oswbb/oswbba.jar -i /opt/oracle/oak/oswbb/archive -b Mar 18 00:00:00 2019 -e Mar 19 00:00:00 
```

## Ressources

Afin de vérifier l’état du paramètre SESSIONS :

> SHOW parameter sessions

## Processes

PROCESSES spécifie le nombre maximal de processus utilisateur du système d’exploitation pouvant se connecter simultanément à Oracle.

Sa valeur doit autoriser tous les processus d’arrière-plan tels que les verrous, les processus de file d’attente de travaux et les processus d’exécution parallèles.

Les valeurs par défaut des paramètres SESSIONS et TRANSACTIONS sont dérivées de ce paramètre.

Par conséquent, si vous modifiez la valeur de PROCESSES, vous devez déterminer si vous souhaitez ajuster les valeurs de ces paramètres dérivés.

Afin de vérifier l’état du paramètre PROCESSES :

> SHOW parameter processes

Application du paramètre :

> ALTER SYSTEM SET processes=[VALUE AS INTEGER] SCOPE=SPFILE ;


## Transactions

TRANSACTIONS spécifie le nombre maximal de transactions simultanées.

Des valeurs plus élevées augmentent la taille du SGA et peuvent augmenter le nombre de segments de restauration alloués.

La valeur par défaut est supérieure à SESSIONS (et à son tour, PROCESSES) pour permettre les transactions récursives.

### Vérifier les paramètres

Afin de vérifier l’état du paramètre TRANSACTIONS :

> SHOW parameter transactions

Application du paramètre :

> ALTER SYSTEM SET transactions=[VALUE AS INTEGER] SCOPE=SPFILE ;

:warning: Application des paramètres :

Afin d’appliquer des paramètres modifiés dans le **spfile**, un relance de l’instance sera requis : 

```SQL
shutdown immediate
startup
```

## Account

Débloquer des compte vérouillé :

```SQL
SQL> conn / AS sysdba
Connected.
SQL> ALTER USER $USER BY ******** account UNLOCK;
USER altered.
SQL> ALTER USER $USER IDENTIFIED BY ******** account UNLOCK;
USER altered.
```

## SQLPLUS

Paramétrage de l’interface sqlplus :

### linesize
La longueur des lignes par défaut 80 caractères :

```SQL
set linesize 200
```

### col 

Il défini un format de sortie pour une colonne particulière :

```SQL
col table_name for a20
```

### set pause on

Permet une attente de RETURN pour faire défiler les lignes suivantes ( comme la commande more).

### spool

La sortie standard et d’erreur est redirigée dans le fichier indiqué dans la commande. La commande “spool off” ferme le fichier.

Utiliser la commande ```SQL **start** or **@** ``` pour effectuer les script tel que .sql

## STATSPACK

### Analyser

Mise en forme du resultat :

```SQL
col OWNER format a10
col SEGMENT_NAME format a60
col SEGMENT_TYPE format a15
set pagesize 1000

select owner,segment_name,segment_type,bytes/1024/1024 fromdba_segments where tablespace_name = 'STATSPACK_TBS' andsegment_type = 'TABLE' order by bytes desc;
```

### Corriger

#### 1. Purge STATSPACK

Renseigner la plage d'id à purger :

```SQL
DEFINE losnapid=1    -- low snap id
DEFINE hisnapid=2    -- high snap id
@?/rdbms/admin/sppurge.sql
```

#### 2. Move table
How to move dba_segments :

```SQL
    select 'alter table '||owner||'.'||segment_name||' move;' from dba_segments where tablespace_name = 'STATSPACK_TBS' and segment_type = 'TABLE' order by bytes desc;
```

#### 3. Rebuild Index

How to rebuild dba_indexes :

```SQL
    select 'alter index '||owner||'.'||index_name||' rebuild;' from dba_indexes where status = 'UNUSABLE';
```

## TNSNAME

Comment la vérifier :

```SQL
    [oracle@oda ~]# env | grep TNS
    TNS_ADMIN=/backup/TNS
```

Le fichier est donc dans ``/backup/TNS/tnsname.ora``.

### Configuration:

Voici un exemple de configuration :

```SQL
(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = ''iP de la machine'')(PORT = 1521))
    
    (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SERVICE_NAME = ''Nom de la base'')  
    )

)
```

## Tablespace

Know the tablesapces size :

```SQL
set line 1000
set pagesize 100
col "Tablespace" FOR a22
col "Used MB" FOR 99,999,999
col "Free MB" FOR 99,999,999
col "Total MB" FOR 99,999,999

SELECT df.tablespace_name "Tablespace",
totalusedspace "Used MB",
(df.totalspace - tu.totalusedspace) "Free MB",
df.totalspace "Total MB",
round(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace))"Pct. Free",
df.MAX_SIZE/1024/1024/1024 "Max Size Go"
FROM
(SELECT tablespace_name,
round(SUM(bytes) / 1048576) TotalSpace, 
sum(decode(AUTOEXTENSIBLE, 'YES', MAXBYTES, BYTES)) MAX_SIZE
FROM dba_data_files 
GROUP BY tablespace_name) df,
(SELECT round(SUM(bytes)/(1024*1024)) totalusedspace, tablespace_name
FROM dba_segments 
GROUP BY tablespace_name) tu
WHERE df.tablespace_name = tu.tablespace_name;
```