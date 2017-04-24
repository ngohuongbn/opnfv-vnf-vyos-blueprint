#!/bin/bash

set -e

ctx logger info "Restart service..."
sudo service ntopng restart
ctx logger info "done!"