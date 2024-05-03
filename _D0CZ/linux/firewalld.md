# Firewall

## Default Configuration of Firewalld Zones

| Zone name | Default configuration |
| - | - |
| trusted | Allow all incoming traffic. |
| home | Reject incoming traffic unless related to outgoing traffic or matching the ssh, mdns, ipp-client, samba-client, or dhcpv6-client pre-defined services. |
| internal | Reject incoming traffic unless related to outgoing traffic or matching the ssh, mdns, ipp-client, samba-client, or dhcpv6-client pre-defined services (same as the home zone to start with). |
| work | Reject incoming traffic unless related to outgoing traffic or matching the ssh, ipp-client, or dhcpv6-client pre-defined services. |
| public | Reject incoming traffic unless related to outgoing traffic or matching the ssh or dhcpv6-client pre-defined services. The default zone for newly added network interfaces. |
| external | Reject incoming traffic unless related to outgoing traffic or matching the ssh pre-defined service. Outgoing IPv4 traffic forwarded through this zone is masqueraded to look like it originated from the IPv4 address of the outgoing network interface. |
| dmz | Reject incoming traffic unless related to outgoing traffic or matching the ssh pre-defined service. |
| block | Reject all incoming traffic unless related to outgoing traffic. |
| drop | Drop all incoming traffic unless related to outgoing traffic (do not even respond with ICMP errors). |

For a list of available pre-defined zones and intended use, see firewalld.zones(5).

## Configuring the Firewall from the Command Line

The firewall-cmd command interacts with the firewalld dynamic firewall manager.

It is installed as part of the main firewalld package and is available for administrators who prefer to work on the command line, for working on systems without a graphical environment, or for scripting a firewall setup.

The following table lists a number of frequently used firewall-cmd commands, along with an explanation.

Note that unless otherwise specified, almost all commands will work on the runtime configuration, unless the **--permanent** option is specified.

If the --permanent option is specified, you **must** activate the setting by also running the `firewall-cmd --reload` command, which reads the current permanent configuration and applies it as the new runtime configuration.

Many of the commands listed take the **--zone=ZONE** option to determine which zone they affect.

Where a netmask is required, use CIDR notation, such as 192.168.1/24.

| firewall-cmd commands | Explanation |
| - | - |
| --get-default-zone | Query the current default zone. |
| --set-default-zone=ZONE | Set the default zone. This changes both the runtime and the permanent configuration. |
| --get-zones | List all available zones. |
| --get-active-zones | List all zones currently in use (have an interface or source tied to them), along with their interface and source information. |
| --add-source=CIDR [--zone=ZONE] | Route all traffic coming from the IP address or network/netmask to the specified zone. If no --zone= option is provided, the default zone is used.
| --remove-source=CIDR [--zone=ZONE] | Remove the rule routing all traffic from the zone coming from the IP address or network/netmask network. If no --zone= option is provided, the default zone is used. |
| --add-interface=INTERFACE [--zone=ZONE] | Route all traffic coming from INTERFACE to the specified zone. If no --zone= option is provided, the default zone is used. |
| --change-interface=INTERFACE [--zone=ZONE] | Associate the interface with ZONE instead of its current zone. If no --zone= option is provided, the default zone is used.
| --list-all [--zone=ZONE] | List all configured interfaces, sources, services, and ports for ZONE. If no --zone= option is provided, the default zone is used. |
| --list-all-zones | Retrieve all information for all zones (interfaces, sources, ports, services).
| --add-service=SERVICE [--zone=ZONE] | Allow traffic to SERVICE. If no --zone= option is provided, the default zone is used. |
| --add-port=PORT/PROTOCOL [--zone=ZONE] | Allow traffic to the PORT/PROTOCOL port(s). If no --zone= option is provided, the default zone is used. |
| --remove-service=SERVICE [--zone=ZONE] | Remove SERVICE from the allowed list for the zone. If no --zone= option is provided, the default zone is used. |
| --remove-port=PORT/PROTOCOL [--zone=ZONE] | Remove the PORT/PROTOCOL port(s) from the allowed list for the zone. If no --zone= option is provided, the default zone is used. |
| --reload | Drop the runtime configuration and apply the persistent configuration. |

---

The example commands below set the default zone to dmz, assign all traffic coming from the 192.168.0.0/24 network to the internal zone, and open the network ports for the mysql service on the internal zone.

```shell
[root@host ~]# firewall-cmd --set-default-zone=dmz
[root@host ~]# firewall-cmd --permanent --zone=internal --add-source=192.168.0.0/24
[root@host ~]# firewall-cmd --permanent --zone=internal --add-service=mysql
[root@host ~]# firewall-cmd --reload
```
