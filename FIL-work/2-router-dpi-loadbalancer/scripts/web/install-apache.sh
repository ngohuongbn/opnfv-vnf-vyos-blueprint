#!/bin/bash

set -e

function install_apache2 {
    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install -y apache2
}

install_apache2