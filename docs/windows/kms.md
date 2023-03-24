# Key Management Services (KMS)

KMS uses a client-server model to active Windows clients and is used for volume activation on your local network.

KMS clients connect to a KMS server, called the KMS host, for activation.

The KMS clients that a KMS host can activate are dependent on the host key used to activate the KMS host.

This article walks you through the steps you need to create a KMS host.

To learn more about KMS and the initial planning considerations, see [Key Management Services (KMS) activation planning](https://learn.microsoft.com/en-us/windows-server/get-started/kms-activation-planning).

## Prerequisites

- A computer running Windows Server or Windows.
    A KMS host running on a Windows Server operating system can activate computers running both server and client operating systems, however a KMS host running on a Windows client operating system can only activate computers also running client operating systems.
- The user account you use must be a member of the Administrators group on the KMS host.
- A KMS host key for your organization. You can get this key from the Product Keys section of the [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).
