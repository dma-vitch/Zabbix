postfix-zabbix-stats
=====
This script collect stats of mails from postfix

=== Requirements

This script was tested for Zabbix 2.0.0 or higher.

=== Installation
1. Install pflogsumm and logtail (apt-get/yum install pflogsumm logtail)
2. Then `postfix-zabbix-stats` in the /usr/local/bin on the server where Postfix is doing its work
3. Then chmod a+x `postfix-zabbix-stats`

=== Usage

	./postfix-zabbix-stats.sh [OPTIONS]
		- received
		- delivered
		- forwarded
		- deferred -
		- bounced
		- rejected
		- held
		- discarded
		- reject_warnings
		- bytes_received
		- bytes_delivered