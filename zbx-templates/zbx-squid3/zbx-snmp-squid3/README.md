Linux zbx-snmp-squid3 Template
---------------------

Requirement:
------------
Version of Squid (2.0 or higher).
Version of Zabbix (2.0 or higher).

Features:
----------

When applying the template to a host Zabbix collects the following items:

- cacheClientHttpRequests -
Number of HTTP requests per second received.
- cacheCpuUsage -
The percentage use of the CPU.
- cacheHttpAllSvcTime.5 -
HTTP all service time. Median time over the last 5 minutes.
- cacheHttpHitSvcTime.5 -
HTTP hit service time. Median time over the last 5 minutes.
- cacheHttpMissSvcTime.5 -
HTTP miss service time. Median time over the last 5 minutes.
- cacheMaxResSize -
Maximum Resident Size in KB.
- cacheMemPercent -
Calculated from cacheMemUsage and MaxResSize.
- cacheMemUsage -
 Total memory accounted for in KB.
- cacheNumObjCount -
Number of objects stored by the cache.
- cacheRequestByteRatio.5 -
Byte Hit Ratio. Median over the last 5 minutes.
- cacheRequestHitRatio.5 -
Request Hit Ratio. Median over the last 5 minutes.
- cacheRequests -
All protocol cache requests per second.


Available graphs:
-----------------
The template defines three graphs:

- Squid_Ratio shows the ratio of hits/non-hits for all requests and the bytes delivered. It gives you an impression what overall impact the squid software has. Sometimes the Byte hit ratio is (much) larger than 100%. That seems to be a bug in the SNMP agent of squid. And I did not find a possibility the limit the measured value to a maximum of 100. 
- The Squid_Timing graph shows you the timing for HTTP objects that were delivered after a cache hit, a cache miss and the mean value over all HTTP objects. In this graph you will see that objects from the cache are delivered much faster that objects that have to be fetched from the internet. The average time should be inbetween both curves. Sometimes you will see peaks in the graphs. This happens when large objects (that take their time) have to be fetched from the internet and very few other (easily retrieved) objects are requested. 
- The Squid_Usage shows you the Memory and CPU usage (left axis) versus the incoming cache requests (right axis). This graph gives you a nice impression about the perfomance of your system. 

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
`
# vi /etc/squid/squid.conf
`

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
- Enter the SNMP community string a macro {$SNMP_COMMUNITY}
- Enter the SQUID port snmp a macro{$SNMP_SQUID_PORT}

Usage:
------
for test
`
snmpget -v2c -c <community> -On -m +ALL -M+<MIB_DIRECTORY> <proxy>:3401  cacheCpuTime.0
`