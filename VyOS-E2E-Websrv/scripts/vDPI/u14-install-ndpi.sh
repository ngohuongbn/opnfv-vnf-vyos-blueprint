#!/bin/bash

set -e

function install_ndpi() {
    sudo wget http://www.nmon.net/apt-stable/14.04/all/apt-ntop-stable.deb 
    sudo dpkg -i apt-ntop-stable.deb
    sudo apt-get update
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install pfring nprobe ntopng ntopng-data n2disk nbox    
    ctx logger info "Sucessfull installation! Preparing for configuration..."
}

install_ndpi