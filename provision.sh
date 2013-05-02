#!/bin/bash

CEPH_CONFIG_FILE=/etc/ceph/ceph.conf
HOSTNAME=$(hostname)
IPADDR=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')":6789"

sed -i "s/\(host *= *\).*/\1$HOSTNAME/" $CEPH_CONFIG_FILE
sed -i "s/\(mon addr *= *\).*/\1$IPADDR/" $CEPH_CONFIG_FILE

logger -s "[clounify] Updating host and ip in ceph config" 2>> /var/log/clounify.log
