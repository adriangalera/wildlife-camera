#!/bin/bash

printf "Installing motion and motioneye ...\n\n"
sudo chmod +x /home/pi/wild/deploy/motioneye-installer.sh
sudo /home/pi/wild/deploy/motioneye-installer.sh

printf "Setting up the system to unblock all radios on startup ...\n\n"
sudo chmod +x /home/pi/wild/deploy/rfkill-unblock-all.sh
sudo /home/pi/wild/deploy/rfkill-unblock-all.sh

printf "Installing bluetooth ...\n\n"
sudo chmod +x /home/pi/wild/deploy/bluetooth-installer.sh
sudo /home/pi/wild/deploy/bluetooth-installer.sh

printf "Installing wild service ...\n\n"
sudo cp /home/pi/wild/api/wild.service /etc/systemd/system/wild.service
sudo chmod 644 /etc/systemd/system/wild.servce
sudo chown root:root /etc/systemd/system/wild.service
sudo systemctl enable wild
sudo systemctl start wild