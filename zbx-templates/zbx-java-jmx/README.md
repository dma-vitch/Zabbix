zabbix-java-tomcat
==================

Requirement:
------------

Version of Zabbix (2.0 or higher).
Java (6 or higher).

Features:
----------

Templates for monitoring Java with Zabbix. 


Available graphs:
-----------------

Installation notes:
-------------------
- Install needs packets in our Zabbix-server
`
# yum -y install zabbix-java-gateway
`
- Configuration in zabbix-server.conf. 
`
# vi /etc/zabbix/zabbix_server.conf
`
Add the below line. Rather un-comment them and add the IP/ports

```
 ### Option: JavaGateway
 #       IP address (or hostname) of Zabbix Java gateway.
 #       Only required if Java pollers are started.
 #
 # Mandatory: no
 # Default:
 JavaGateway=your ip

 ### Option: JavaGatewayPort
 #       Port that Zabbix Java gateway listens on.
 #
 # Mandatory: no
 # Range: 1024-32767
 # Default:
 JavaGatewayPort=10052

 ### Option: StartJavaPollers
 #       Number of pre-forked instances of Java pollers.
 #
 # Mandatory: no
 # Range: 0-1000
 # Default:
  StartJavaPollers=5
```
- Configuring zabbix-java-gateway
`
# vi /etc/zabbix/zabbix_java_gateway.conf
`

Add or edit the below line
```  
   ### Option: zabbix.listenIP
 #       IP address to listen on.
 #
 # Mandatory: no
 # Default:
 LISTEN_IP="your ip"

 ### Option: zabbix.listenPort
 #       Port to listen on.
 #
 # Mandatory: no
 # Range: 1024-32767
 # Default:
 LISTEN_PORT=10052

 ### Option: zabbix.pidFile
 #       Name of PID file.
 #       If omitted, Zabbix Java Gateway is started as a console application.
 #
 # Mandatory: no
 # Default:
 # PID_FILE=

 PID_FILE="/var/run/zabbix/zabbix_java.pid"

 ### Option: zabbix.startPollers
 #       Number of worker threads to start.
 #
 # Mandatory: no
 # Range: 1-1000
 # Default:
 START_POLLERS=5
```
- Import template into web frontend.
- Link template with monitoring hosts.
- change setting the values of macros in templates:

```
{$JXM_USERNAME} jmx_username
{$JXM_PASSWORD} jmx_password
```