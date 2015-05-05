check.bkp.sh
===========

Installation
------------

1. Install `check.bkp.sh` in your Script directory of your Zabbix host. Check your `zabbix_agentd.conf.
2. Then chmod a+x `check.bkp.sh`
3. For Zabbix User you can allow execute some command (cat, sudo) in /etc/sudoers
### Requirements

This script was tested for Zabbix 2.0.0 or higher.

Usage
-----

### As a script
    ./check.bkp.sh [OPTIONS]

    where OPTIONS are :
     $1								locate you log files
     $2								type of error(warn, error,critical,etc)					  
     
### As an item
Use `check.bkp.sh` like an **Zabbix agent Check** item in Zabbix.  So, when creating an item, select **Zabbix agent Check**.  In the **Key** field, you specify:

    chk.bkp[$1,$2]

Version
-------

Version 1.0.0

License
-------

This script is distributed under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

### Copyright

  Copyright (c) Ilya Shataev

### Authors

  Ilya Shataev
  (for_registration_forum |at| mail |dot| ru)
