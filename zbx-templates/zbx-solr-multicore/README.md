Zabbix-solr-multicore Templates
-------------------------------
Primitive solution for SolR monitoring

Requirement:
------------

Version of Zabbix (2.0 or higher).

Version of Solr (4.0.x or higher)

Features:
----------

Templates for monitoring Solr with Zabbix and auto-discovery cores.

- monitoring some cache / document values.
- JVM stats

This solution is a combination of built-in jvm template and https://github.com/flaviotorres/zabbix using JMX connector

Available graphs:
-----------------

- {#CORENAME} - Requests

Available trigers:
-----------------

- check service running

Installation notes:
-------------------

- solr.conf - the contents of this file should be placed in the configuration file zabbix agent, or putting the directory configuration that is specified in the main configuration options Include agent.
for example `/etc/zabbix/zabbix_agentd.d`. Do not forget change path to you external scripts directory
- install script [`solr-pypoll.py`] (https://github.com/dma-vitch/Zabbix/tree/master/zbx-scripts/solr.discovery) -  to `/etc/zabbix/script/`. Here you can also use your comfortable accommodation, but in this case do not forget to improve the way the parameters defined in solr.conf.
Do not forget to check that they are executable (mode = 755).

- Discovery Rule. It use this URL `http://severip:port/admin/cores?action=STATUS` which returns xml list of cores.

- Import template into web frontend.
- Link template with monitoring hosts.

Usage
------
Manual run script for testing 
`
python solr-pypoll.py {port}
`