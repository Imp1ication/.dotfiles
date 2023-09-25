# Rofi

## Screenshot

### drun

![](https://i.imgur.com/SA3QX7p.jpg)

### powermenu

![](https://i.imgur.com/cK6ZyDs.jpg)

### wifimenu

![](https://i.imgur.com/z25Tzjh.jpg)

## Installation

- Install Rofi

```
sudo apt-get install rofi
```

- Install `powermenu` and `wifimenu` scripts

Download the scripts from [here](https://github.com/Imp1ication/.dotfiles/tree/master/bin), and then run the commands below to grant executable permission and create symbolic links.

```
chmod +x powermenu wifimenu
ln -sf powermenu ~/.local/bin/powermenu
ln -sf wifimenu ~/.local/bin/wifimenu
```

## Usage

Rofi can be used with the following commands:

```
rofi                    # Display currently active and inactive modes
rofi-theme-selector     # Change built-in themes
rofi -show drun         # Launch runnable desktop apps
rofi -show window       # Launch current windows
rofi -show run          # Launch all runnable programs
```

Additionally, you can run ```powermenu``` and ```wifimenu``` as commands using additional scripts.

## References

- [Rofi](https://github.com/davatorium/rofi)
- [How to Setup and Configure Rofi (The Best App Launcher)](https://youtu.be/TutfIwxSE_s?si=H4NDGOR7XsC70G_U)
- [Using Rofi for EVERYTHING! (Wifi menu, emoji selector, calculator, & more)](https://youtu.be/v8w1i3wAKiw?si=HPKnVngEIKIEsMw3)