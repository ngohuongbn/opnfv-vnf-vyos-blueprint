#!/bin/bash

set -e

export VROUTER_HOST=$(ctx instance runtime_properties vrouter_ip_address)
sudo echo $VROUTER_HOST > ~/vyos_ip.sh
ctx logger info "Successfully set gateway"