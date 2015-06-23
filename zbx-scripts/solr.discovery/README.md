solr-pypoll.py
===========

Installation
------------

1. Install `solr-pypoll.py` in your Script directory of your Zabbix host. Check your `zabbix_agentd.conf.
2. Then chmod a+x `solr-pypoll.py`
3. For Zabbix User you can allow execute some command (cat, sudo) in /etc/sudoers

### Requirements

This script was tested for Zabbix 2.0.0 or higher.

Usage
-----

### As a script
    ./solr-pypoll.py [OPTIONS]

    where OPTIONS are :
     $1								port you solr server
     				  
     
### As an item
Use `solr-pypoll.py` like an **Zabbix agent Check** item in Zabbix.  So, when creating an item, select **Zabbix agent Check**.  In the **Key** field, you specify:

    solr.core.discovery[$1]

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
