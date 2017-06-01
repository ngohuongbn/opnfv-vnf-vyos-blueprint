#!/bin/bash

source env.sh

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf; 
sysctl -p /etc/sysctl.conf

# for webserver behind firewall
iptables -t nat -I PREROUTING -i $FW_INT_PUB_NAME -p tcp --dport 80 -j DNAT --to-destination $WEBSRV_INT_DMZ_ADDR
iptables -t nat -I POSTROUTING -o $FW_INT_DMZ_NAME -p tcp --dport 80 -j SNAT --to-source $FW_INT_DMZ_ADDR
iptables -A FORWARD -i $FW_INT_PUB_NAME -o $FW_INT_DMZ_NAME -p tcp --dport 80 -d $WEBSRV_INT_DMZ_ADDR -j ACCEPT
iptables -t nat -A POSTROUTING -s $DMZ_NET -o $FW_INT_PUB_NAME -j SNAT --to-source $FW_INT_PUB_ADDR

# for wan optimizer behind firewall
iptables -t nat -I PREROUTING -i $FW_INT_PUB_NAME -p tcp --dport 443 -j DNAT --to-destination $WEBSRV_INT_DMZ_ADDR
iptables -t nat -I POSTROUTING -o $FW_INT_DMZ_NAME -p tcp --dport 443 -j SNAT --to-source $FW_INT_DMZ_ADDR
iptables -A FORWARD -i $FW_INT_PUB_NAME -o $FW_INT_DMZ_NAME -p tcp --dport 443 -d $WEBSRV_INT_DMZ_ADDR -j ACCEPT
iptables -t nat -A POSTROUTING -s $DMZ_NET -o $FW_INT_PUB_NAME -j SNAT --to-source $FW_INT_PUB_ADDR
