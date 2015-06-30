Linux iostat Template
---------------------

Requirement:
------------

For monitoring sysstat needed since version 9.1.2, because there is a very important change: «Added r_await and w_await fields to iostat's extended statistics».
So be careful, some distributions, such as CentOS little "stable" and less ability version of sysstat.
Version of Zabbix (2.0 or higher).

Features:
----------

- Low level discovery (hereinafter simply LLD) for automatic detection of block devices on a host;
- Disposal block device% - convenient metric to track the total load on the device;
- latency or responsiveness - is available as a general responsiveness, and responsiveness to the read / write;
- the value of the queue (in requests) and the average size of the request (in the sector) - to evaluate the nature and extent of the workload load devices;
- current speed of read / write device chelovekoponyatnyh kilobytes;
- the number of read / write requests (per second) combined while queued for execution;
- iops - the value of read / write operations per second;
    the average time of service requests (svctm). Generally it is deprecated, developers promise to cut her long, but it did not reach his hands.

Available graphs:
-----------------

Charts are drawn per-device, LLD discovers devices that fall under the regular expression "(xvd | sd | hd | vd) [az]", so if your disks have different names, you can easily make the appropriate changes. Such regular season is done to detect the device that will be the parent in relation to the other sections, LVM volumes, MDRAID arrays, etc. In general not to collect too much. A little distracted, so the list of schedules:

- Disk await - responsive device (r_await, w_await);
- Disk merges - merge operation in the queue (rrqm / s, wrqm / s);
- Disk queue - queue status (avgrq-sz, avgqu-sz);
- Disk read and write - the current value of the read / write device (rkB / s, wkB / s);
- Disk utilization - and the importance of recycling disk IOPS (% util, r / s, w / s) - allows you to keep track of good jumps in recycling and than read or write, they were called.

Installation notes
------------------

- iostat.conf - the contents of this file should be placed in the configuration file zabbix agent, or putting the directory configuration that is specified in the main configuration options Include agent.
for example /etc/zabbix/zabbix_agentd.d
- scripts iostat-collect.sh and iostat-parse.sh - the two working script should be copied to /etc/zabbix/script/.Here you can also use your comfortable accommodation, but in this case do not forget to improve the way the parameters defined in iostat.conf.
Do not forget to check that they are executable (mode = 755).
- Import template into web frontend.
- Link template with monitoring hosts.
