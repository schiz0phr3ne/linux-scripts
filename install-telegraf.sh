#!/usr/bin/env bash
msg_info "Installing Dependencies"
apt-get install -y lsb-base &>/dev/null
apt-get install -y lsb-release &>/dev/null
apt-get install -y gnupg2 &>/dev/null
msg_ok "Installed Dependencies"

msg_info "Setting up InfluxDB Repository"
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add - &>/dev/null
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list &>/dev/null
msg_ok "Set up InfluxDB Repository"

msg_info "Installing Telegraf"
apt-get install -y telegraf &>/dev/null
msg_ok "Installed Telegraf"

msg_info "Cleaning up"
apt-get autoremove >/dev/null
apt-get autoclean >/dev/null
rm -rf /var/{cache,log}/* /var/lib/apt/lists/*
msg_ok "Cleaned"
