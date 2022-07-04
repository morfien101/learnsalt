#!/bin/bash
ip_base="192.168.56"
if ! grep $ip_base /etc/hosts; then
  echo "Setting up hosts file"
  echo "${ip_base}.10 master" >> /etc/hosts

  for i in {1..9}; do 
    echo "${ip_base}.1${i} minion${i}" >> /etc/hosts
  done
fi