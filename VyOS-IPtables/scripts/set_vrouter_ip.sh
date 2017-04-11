#!/bin/bash

set -e

if [ "$vrouter_ip_address" = "" ];then
    vrouter_ip_address=$(ctx target instance host_ip)
fi

ctx source instance runtime_properties vrouter_ip_address "$vrouter_ip_address"
