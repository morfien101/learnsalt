#!/bin/bash
if ! which salt; then
  apt-get update
  apt-get install -y vim curl wget htop python3-pip net-tools bind9-utils
  pip install --upgrade pip
  pip install salt
fi