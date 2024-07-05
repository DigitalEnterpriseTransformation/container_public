#!/bin/bash
cp /tmp/mysqlrouter.conf /etc/mysqlrouter/mysqlrouter.conf
sed -i 's%\$RW_DESTINATIONS%'$RW_DESTINATIONS'%g' /etc/mysqlrouter/mysqlrouter.conf
sed -i 's%\$RO_DESTINATIONS%'$RO_DESTINATIONS'%g' /etc/mysqlrouter/mysqlrouter.conf
/usr/bin/mysqlrouter --config=/etc/mysqlrouter/mysqlrouter.conf
