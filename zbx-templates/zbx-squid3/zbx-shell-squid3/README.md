Linux zbx-shell-squid Template
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
- squid.conf - the contents of this file should be placed in the configuration file zabbix agent, or putting the directory configuration that is specified in the main configuration options Include agent.
for example `/etc/zabbix/zabbix_agentd.d`
- Import template into web frontend.
- Link template with monitoring hosts.

Usage:
------
for test