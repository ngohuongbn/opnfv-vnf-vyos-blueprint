#!/bin/bash

set -e

function config_ntopng() {
    FIRST_INT=`ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | head -1`
    FIRST_INT_IP=`ifconfig ${FIRST_INT} | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`
    sudo chmod go+w /etc/ntopng.conf
    sudo cat << EOF > /etc/ntopng.conf
-e=
-i=${FIRST_INT}
-w=3000
EOF

    sudo systemctl restart ntopng
    sudo ntopng -h
    sudo ufw allow 3000
    ctx logger info "Sucessfully configure ntopng"
    ctx logger info "Ntopng is running: http://$FIRST_INT_IP:3000"    
}

config_ntopng
