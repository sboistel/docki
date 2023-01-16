# Selinux

## Basic SELinux security concepts

SELinux is a set of security rules that determine which process can access which files, directories, and ports.

Every file, process, directory, and port has a special security label called an SELinux context.

A **context** is a name used by the _SELinux policy_ to determine whether a process can access a file, directory, or port. 

By default, the policy **does not allow any interaction** unless an explicit rule grants access. If there is no allow rule, no access is allowed.

SELinux labels have several contexts: 

* user
* role
* type
* sensitivity 

The targeted policy, which is the default policy enabled in Red Hat Enterprise Linux, bases its rules on the third context: the type context usually named end **with _t**.

![SELinux File Context](resources/selinux_context.png)

## Setting the default SELinux mode

You can also configure SELinux persistently using the /etc/selinux/config file. In the example below (the default configuration), the configuration file sets SELinux to enforcing. The comments also show the other valid values: permissive and disabled.

```shell
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=enforcing
# SELINUXTYPE= can take one of these two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes
#               are protected.
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
```

The system reads this file at boot time and configures SELinux as shown.
Kernel arguments (_selinux=0|1 and enforcing=0|1_) override this configuration.

## Changing the current SELinux mode

The SELinux subsystem provides tools to display and change modes. To determine the current SELinux mode, run the getenforce command. To set SELinux to a different mode, use the setenforce command:

```shell
[user@host ~]# getenforce
Enforcing
[user@host ~]# setenforce
usage:  setenforce [ Enforcing | Permissive | 1 | 0 ]
[user@host ~]# setenforce 0
[user@host ~]# getenforce
Permissive
[user@host ~]# setenforce Enforcing
[user@host ~]# getenforce
Enforcing
```

Alternatively, you can set the SELinux mode at boot time by passing a parameter to the kernel: the kernel argument of enforcing=0 boots the system into permissive mode; a value of enforcing=1 sets enforcing mode. 
You can also disable SELinux completely by passing on the kernel parameter selinux=0. A value of selinux=1 enables SELinux.

## Basic file context operations

To ensure that you have the tools to manage SELinux contexts, install these packages : 

* policycoreutils
* policycoreutils-python

These contain the **restorecon** command and **semanage** command, respectively.

To ensure that all files in a directory have the correct file context run the `semanage fcontext -l` followed by the restorecon command.

In the following example, note the file context of each file before and after the semanage and restorecon commands run.

```shell
[root@host ~]# ls -Z /var/www/html/file*
unconfined_u:object_r:user_tmp_t:s0 /var/www/html/file1  unconfined_u:object_r:httpd_sys_content_t:s0 /var/www/html/file2  
```

```shell
[root@host ~]# semanage fcontext -l
...output omitted...
/var/www(/.*)?       all files    system_u:object_r:httpd_sys_content_t:s0
...output omitted... 
```

```shell
[root@host; ~]# restorecon -Rv /var/www/
Relabeled /var/www/html/file1 from unconfined_u:object_r:user_tmp_t:s0 to unconfined_u:object_r:httpd_sys_content_t:s0
[root@host ~]# ls -Z /var/www/html/file*
unconfined_u:object_r:httpd_sys_content_t:s0 /var/www/html/file1  unconfined_u:object_r:httpd_sys_content_t:s0 /var/www/html/file2
```

The following example shows how to use semanage to add a context for a new directory.

```shell
[root@host ~]# mkdir /virtual
[root@host ~]# touch /virtual/index.html
[root@host ~]# ls -Zd /virtual/
drwxr-xr-x. root root unconfined_u:object_r:default_t:s0 /virtual/ 
```

```shell
[root@host ~]# ls -Z /virtual/
-rw-r--r--. root root unconfined_u:object_r:default_t:s0 index.html
[root@host ~]# semanage fcontext -a -t httpd_sys_content_t '/virtual(/.*)?'
[root@host ~]# restorecon -RFvv /virtual
[root@host ~]# ls -Zd /virtual/
drwxr-xr-x. root root system_u:object_r:httpd_sys_content_t:s0 /virtual/
[root@host ~]# ls -Z /virtual/
-rw-r--r--. root root system_u:object_r:httpd_sys_content_t:s0 index.html
```
