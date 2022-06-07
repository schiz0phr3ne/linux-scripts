#!/usr/bin/env bash

echo "Installing dependencies..."
apt-get update &>/dev/null
apt-get install -y lsb-base &>/dev/null
apt-get install -y lsb-release &>/dev/null
apt-get install -y gnupg2 &>/dev/null
echo "Dependencies installed..."

echo "Installing Telegraf repository..."
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add - &>/dev/null
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list &>/dev/null
echo "Repository installed..."

echo "Installing Telegraf..."
apt-get update &>/dev/null
apt-get install -y telegraf &>/dev/null
echo "Telegraf installed..."

echo "Cleaning up..."
apt-get autoremove &>/dev/null
apt-get autoclean &>/dev/null
rm -rf /var/{cache,log}/* /var/lib/apt/lists/* &>/dev/null
echo "Cleaned..."

echo "Telegram successfully installed !"
