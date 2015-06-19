Postfix Template
------------------

=== Requirements:
- Version of Zabbix (2.0 or higher).
- pflogsumm & logtail
- A shell script on the server running Postfix which returns us some useful numbers
- Zabbix agent with Remote commands enabled
- The corresponding Zabbix templates
- A cronjob to update the stats file

=== Features:
- collect stats of mail server postfix

=== Available graphs:
- Postfix Error Pie -(bounced,deferred,discarded,rejected,reject_warnings)
- Postfix Mails - Scoreboard received, forwards,rejects mails 
- Postfix Traffic - received and delivered on bytes

=== Installation notes
- Add to zabbix_agentd.conf on the client needs the following lines:

		EnableRemoteCommands=1
- postfix.conf - the contents of this file should be placed in the configuration file zabbix agent, or putting the directory configuration that is specified in the main configuration options Include agent.For example */etc/zabbix/zabbix_agentd.d*
- script [`postfix-zabbix-stats.sh`](https://github.com/dma-vitch/Zabbix/blob/master/zbx-scripts/postfix.check/postfix-zabbix-stats.sh) in the script directory of your Zabbix agent. working script should be copied to /etc/zabbix/script/.Here you can also use your comfortable accommodation, but in this case do not forget to improve the way the parameters defined in postfix.conf.
Do not forget to check that they are executable (mode = 755).
- edit crontab entry to periodically update the stats file the following lines:
	
		*/5 * * * * /usr/local/bin/postfix-zabbix-stats.bash
- Import template into web frontend.
- Link template with monitoring hosts.
