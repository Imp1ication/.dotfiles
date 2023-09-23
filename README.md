# .dotfiles

## Screenshot
### Overview

![](https://i.imgur.com/DfFuJKS.png)

### Launcher

![](https://i.imgur.com/DdnlO7S.png)

### Lock Screen

![](https://i.imgur.com/rqoWajz.png)

## Workflow

- Window manager: i3
- Lock screen: betterlockscreen
- Terminal emulator: Alacritty
- Shell: fish
- Launcher: Rofi
- Editor: LunarVim
- Fonts & Icons: Nerd Fonts
- Input source: rime

## Installation

### Dependencies

```
sudo apt-get install fzf curl git rpm unzip -y
```

### Nerd Fonts

- Install getNF

```
git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
```

- Download Fonts

Visit the [Nerd Fonts](https://www.nerdfonts.com/) website to find a font you like! You can directly preview the appearance of various fonts [here](https://www.programmingfonts.org/).

Some of the more popular ones should be Hack, FiraCode, SourceCode Pro, Mosle, and more. Personally, I use Hack and FiraCode.

![](https://i.imgur.com/lXT6zpw.jpg)

Once you've found the font you like, execute `./getNF` and choose to download the font you want.

![](https://i.imgur.com/FUyppY5.png)

### My dotfiles

- Clone the repository into your ```$HOME``` directory or ```~```.

```
git clone https://github.com/Imp1ication/.dotfiles.git
```

- Make the scripts executable:

```
cd .dotfiles/scripts
chmod +x install.sh symlinks.sh
```

-  Installing and creating symlinks:

```
./install.sh
./symlink.sh
```
