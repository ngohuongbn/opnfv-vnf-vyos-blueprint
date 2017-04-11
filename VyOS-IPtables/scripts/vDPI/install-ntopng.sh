#!/bin/bash

set -e

function install_ntopng() {
    sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get install ntopng
    ctx logger info "Sucessfully install ntopng"
}

install_ntopng