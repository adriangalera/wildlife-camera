# wildlife-camera

This project implements a wildlife camera using a Raspberry Pico Zero W.

## Installing

1. Change the hostname to `wild` using `raspi-config`

2. Enable the usage of camera using `raspi-config`

3. Enable radio on startup, add `systemd.restore_state=0 rfkill.default_state=1` to `/boot/cmdline.txt`. If you are
   going to use the radio kill option, this will enable the radio back on boot.

4. Install `motioneye` from https://github.com/ccrisan/motioneye/wiki/Install-On-Raspbian. Execute all the commands
   using `sudo` (even pip)

5. Enable bluetooth access following this
   guide: https://nano.dannyvacar.ca/post/2019-12-13-raspberry-pi-ssh-over-bluetooth/. Ignore the part of `wlan0`. You
   will find your device in `192.168.20.99`. Apart from pairing the devices, you need also to
   run `trust aa:bb:cc:dd:ee:ff` command on `bluetoothctl`.
   
6. Clone this project and run the installation script: 
```
git clone https://github.com/adriangalera/wildlife-camera.git
cd wildlife-camera
sudo chmod +x ./install
sudo ./install
```
   
## Tips

While setting the bluetooth access, the default routes go to bluetooth, then the device does not know how to reach internet.
If you need to use internet, execute the following:

```
sudo route add default gateway 192.168.1.1
```