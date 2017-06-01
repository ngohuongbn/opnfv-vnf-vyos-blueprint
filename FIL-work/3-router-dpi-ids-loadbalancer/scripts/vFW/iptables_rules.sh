#!/bin/bash

set -e 

FIRST_INT=`ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | head -1`
FIRST_INT_IP=`ifconfig ${FIRST_INT} | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`

function set_iptables_rules() {
    sudo chmod go+w /etc/sysctl.conf
    sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf; 
    sudo sysctl -p /etc/sysctl.conf
    sudo iptables -t nat -A POSTROUTING -s ${DMZ_CIDR} -o ${FIRST_INT} -j SNAT --to-source ${FIRST_INT_IP}
}

set_iptables_rules
ctx logger info "Sucessfully set iptables rules!"
sudo echo "${FIRST_INT}: ${FIRST_INT_IP}" >> ~/log.info
sudo echo "DMZ_CIDR: ${DMZ_CIDR}" >> ~/log.info