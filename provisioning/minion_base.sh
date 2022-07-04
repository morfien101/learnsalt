#!/bin/bash
# Setup dns lookups
ip_base="192.168.56"
echo "${ip_base}.10 master" >> /etc/hosts

# Basic setup
BASE_PATH="/etc/salt"
MINION_PATH="$BASE_PATH/minion.d"

mkdir -p $MINION_PATH

# This config states where the master is to connect to.
cat << EOF > $MINION_PATH/master.conf
master: master
EOF

# Set the name of the server when it creates the key
echo $(hostname) >> $BASE_PATH/minion_id