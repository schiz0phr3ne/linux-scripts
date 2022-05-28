#!/usr/bin/env bash
apt-get update

apt-get install -y lsb-base
apt-get install -y lsb-release
apt-get install -y gnupg2

wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

apt-get update

apt-get install -y telegraf

apt-get autoremove
apt-get autoclean
rm -rf /var/{cache,log}/* /var/lib/apt/lists/*
