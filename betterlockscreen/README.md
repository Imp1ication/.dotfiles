# betterlockscreen 

## Screenshot

![](https://i.imgur.com/rqoWajz.png)

## Dependencies

- [i3lock-color](https://github.com/Raymo111/i3lock-color)
- [ImageMagick](https://imagemagick.org/)

## Installation

- i3lock-color

```
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
sudo ./install-i3lock-color.sh
```

- ImageMagick

```
sudo apt-get install imagemagick -y
```

- betterlockscreen
 
```
wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
unzip main.zip

cd betterlockscreen-main/
chmod u+x betterlockscreen
sudo cp betterlockscreen /usr/local/bin/

sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
systemctl enable betterlockscreen@$USER
```

- Run `betterlockscreen` to see the usage.

![](https://i.imgur.com/yEf4xSl.jpg)

## References

- [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- [My New Favorite Lock Screen for Linux! (betterlockscreen)](https://youtu.be/WmGfZ6ksvBA?si=RyDhrGvY1zUPkzDc)
- [Linux: How To Setup A Lockscreen To Run On Sleep/Suspend](https://www.youtube.com/watch?v=-jA2OzttHQI)
