Linux zbx-snmp-squid3 Template
---------------------

Requirement:
------------
Version of Squid (2.0 or higher).
Version of Zabbix (2.0 or higher).

Features:
----------

Available graphs:
-----------------


Installation notes
------------------
- Enabling SNMP in Squid
Squid-3
It's now built in by default. Simply add the configuration options to squid.conf.

Squid-2
To use SNMP, it must first be enabled with the configure script, and squid rebuilt. To enable is first run the script:

```
./configure --enable-snmp  [ ... other configure options ]
Next, recompile after cleaning the source tree :


make clean
make all
make install
```

Once the compile is completed and the new binary is installed the squid.conf file needs to be configured to allow access; the default is to deny all requests.

You may also want to move the Squid mib.txt into your SNMP MIB directory so that you can view the output as text rather than raw OID numbers.

- Configuring Squid
To configure SNMP first specify a list of communities that you would like to allow access by using a standard acl of the form:

`
acl snmppublic snmp_community public
`

This create acl's, with communities, public. You can name the acl's and the community strings anything that you like.

To specify the port that the agent will listen on modify the snmp_port parameter, the official SNMP port is 3401.

`
snmp_port 3401
`

To allow access to Squid's SNMP agent, define an snmp_access ACL with the community strings that you previously defined.
```
snmp_access allow snmppublic localhost
snmp_access deny all
```

The above will allow anyone on the localhost or localnet who uses the community public to access the agent. It will deny all others access.

- !If you do not define any snmp_access ACL's, then SNMP access is denied by default.
Finally squid allows to you to configure the address that the agent will bind to for incoming and outgoing traffic. These are defaulted to all addresses on the system, changing these will cause the agent to bind to a specific address on the host.

Defaults:
```
snmp_incoming_address 0.0.0.0
snmp_outgoing_address 0.0.0.0
```

- Import template into web frontend.
- Link template with monitoring hosts.