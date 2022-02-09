# Bareos
Job
===
How do job command works ?

| Mean                                | Command                                |
|-------------------------------------|----------------------------------------|
| Which files shall be backed up?     | show filesets (I=Included, E=Excluded) |
| What’s the server doing?            | status dir                             |
| What’s the status of a certain job? | status jobid=xx                        |
| What’s the client doing?            | status client                          |
| What’s the streamer doing?          | status storage                         |
| Anything new?                       | messages                               |

| Means                       | Command             |
|-----------------------------|---------------------|
| Last jobs                   | list jobs           |
| Specifique Job              | list jobid=xx       |
| Statistics about last jobs  | list jobtotal       |
| Which files were backed up? | list files jobid=xx |


Status
------
Table view of jobs status :

| Status | means                                     |
|--------|-------------------------------------------|
| T      | Terminated normally                       |
| C      | Created but not yet running               |
| R      | Running                                   |
| B      | Blocked                                   |
| E      | Terminated in Error                       |
| e      | Non-fatal error                           |
| f      | Fatal error                               |
| D      | Verify Differences                        |
| A      | Canceled by the user                      |
| F      | Waiting on the File daemon                |
| S      | Waiting on the Storage daemon             |
| m      | Waiting for a new Volume to be mounted    |
| M      | Waiting for a Mount                       |
| s      | Waiting for Storage resource              |
| j      | Waiting for Job resource                  |
| c      | Waiting for Client resource               |
| d      | Wating for Maximum jobs                   |
| t      | Waiting for Start Time                    |
| p      | Waiting for higher priority job to finish |
| W      | Terminated with warnings                  |


Level
-----

### Level list of jobs
- Base
- Catalog
- Data
- Differential
- DiskToCatalog
- Full
- Incremental
- InitCatalog
- Since
- VirtualFull
- VolumeToCatalog

