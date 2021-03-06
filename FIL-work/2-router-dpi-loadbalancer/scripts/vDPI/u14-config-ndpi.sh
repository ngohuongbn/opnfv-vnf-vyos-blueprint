#!/bin/bash

set -e

FIRST_INT=`ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | head -1`
FIRST_INT_IP=`ifconfig ${FIRST_INT} | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`

function config_ndpi() {
    sudo touch /etc/ntopng/ntopng.conf
    sudo chmod go+w /etc/ntopng/ntopng.conf

    sudo cat << EOF > /etc/ntopng/ntopng.conf
--pid-path=/var/run/ntopng.pid
--daemon
--interface=${FIRST_INT}
--http-port=3000
--local-networks="${MGMT_CIDR}"
--dns-mode=1
--data-dir=/var/tmp/ntopng
--disable-autologout
--community
EOF

    sudo touch /etc/ntopng/ntopng.start
    sudo service ntopng restart
    sudo ufw allow 3000/tcp
    sudo ufw reload
    sudo echo "${MGMT_CIDR}" > ~/mgmt-cidr.log
    ctx logger info "Configure ntopng sucessfully!"
    ctx logger info "Ntopng is running: http://$FIRST_INT_IP:3000"   
}

config_ndpi