#!/bin/bash -e

ctx logger info "Installing HAProxy"

if command -v yum > /dev/null 2>&1; then
    sudo yum install -y haproxy
elif command -v apt-get > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get -y install haproxy
    sudo chmod go+w /etc/haproxy/haproxy.cfg
    sudo chmod go+w /etc/default/haproxy 
    sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orig
    sudo cp /etc/default/haproxy /etc/default/haproxy.orig
    sudo /bin/sed -i s/ENABLED=0/ENABLED=1/ /etc/default/haproxy
else
    ctx abort-operation "Unsupported distribution"
fi

ctx logger info "Installed HAProxy"
