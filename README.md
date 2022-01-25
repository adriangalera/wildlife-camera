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

- Copy the contents of this repo to `wild`:

```
scp -r * pi@wild.local:/home/pi/wild
```

- Execute the install script:
```
chmod +x wild/deploy/install.sh
wild/deploy/install.sh
```

## Tips

Check if the camera is detected and working:

```
vcgencmd get_camera
supported=1 detected=1
```

Take a shot with the camera:
```
raspistill -o test.jpg
```

## Things to try:

- https://raspberrypi.stackexchange.com/questions/29504/how-can-i-set-up-a-bluetooth-pan-connection-with-a-raspberry-pi-and-an-ipod