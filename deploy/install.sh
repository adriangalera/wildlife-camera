#!/bin/bash

printf "Installing motion and motioneye ...\n\n"
chmod +x /home/pi/wild/deploy/motioneye-installer.sh
/home/pi/wild/deploy/motioneye-installer.sh

printf "Setting up the system to unblock all radios on startup ...\n\n"
chmod +x /home/pi/wild/deploy/rfkill-unblock-all.sh
/home/pi/wild/deploy/rfkill-unblock-all.sh

printf "Installing bluetooth ...\n\n"
chmod +x /home/pi/wild/deploy/bluetooth-installer.sh
/home/pi/wild/deploy/bluetooth-installer.sh