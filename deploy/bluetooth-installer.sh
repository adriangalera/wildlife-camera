#!/bin/bash
printf "Installing bluez-tools ...\n\n"
sudo apt-get install bluez-tools -y

printf "Setting up the services required ...\n\n"
cat >/etc/systemd/network/pan0.netdev <<EOF
[NetDev]
Name=pan0
Kind=bridge
EOF
cat >/etc/systemd/network/pan0.network <<EOF
[Match]
Name=pan0

[Network]
Address=172.20.1.1/24
DHCPServer=yes
EOF
cat >/etc/systemd/system/bt-agent.service <<EOF
[Unit]
Description=Bluetooth Auth Agent

[Service]
ExecStart=/usr/bin/bt-agent -c NoInputNoOutput
Type=simple

[Install]
WantedBy=multi-user.target
EOF
cat >/etc/systemd/system/bt-network.service <<EOF
[Unit]
Description=Bluetooth NEP PAN
After=pan0.network

[Service]
ExecStart=/usr/bin/bt-network -s nap pan0
Type=simple

[Install]
WantedBy=multi-user.target
EOF
printf "Enabling and starting the services ...\n\n"
sudo systemctl enable systemd-networkd
sudo systemctl enable bt-agent
sudo systemctl enable bt-network
sudo systemctl start systemd-networkd
sudo systemctl start bt-agent
sudo systemctl start bt-network
sudo bt-adapter --set Discoverable 1