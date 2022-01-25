#!/bin/bash

printf "Installing requirements for motioneye ... \n\n"
sudo apt-get install ffmpeg libmariadb3 libpq5 libmicrohttpd12 python2.7 python2.7-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libz-dev -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2.7 get-pip.py
wget https://github.com/Motion-Project/motion/releases/download/release-4.3.2/pi_buster_motion_4.3.2-1_armhf.deb
sudo dpkg -i pi_buster_motion_4.3.2-1_armhf.deb

printf "Installing motioneye ... \n\n"
sudo pip install motioneye

printf "Configuring motioneye ... \n\n"
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
sudo mkdir -p /var/lib/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye

printf "motioneye ready !\n\n"
