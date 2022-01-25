# wildlife-camera

This project implements a wildlife camera using a Raspberry Pico Zero W.

## Installing

- Update libraries:

```
sudo apt-get update
sudo apt-get upgrade raspi-config
```

- Change the hostname to `wild` using `raspi-config`

- Enable the usage of camera using `raspi-config`

- Install `motioneye` from https://github.com/ccrisan/motioneye/wiki/Install-On-Raspbian. Execute all the commands
   using `sudo` (even pip)