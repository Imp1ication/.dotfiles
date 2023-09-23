# Alacritty

## Installation

- Install alacritty：

```bash
sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty
```
    
- Change default terminal-emulator：

```bash
sudo update-alternatives --config x-terminal-emulator
```

After running above command, you will receive a list of all currently available terminal emulators. Locate the terminal you wish to select and enter the corresponding serial number to choose it.

![](https://hackmd.io/_uploads/SJyIlnaCh.png)

## Themes

You can preview and download common color themes in [alacritty-theme](https://github.com/alacritty/alacritty-theme).

Once you’ve found the theme you like, go [here](https://github.com/eendroroy/alacritty-theme/tree/master/themes) to download the yaml file for that theme to your configuration folder (usually ```~/.config/alacritty/```), and modify the config file ```alacritty.yml``` as below.

```yaml
import:
    - ~/.config/alacritty/{themes.yaml}
# {themes.yaml} will be your theme file.
# I'm currently using tokyonight_night.yml.
```

Alternatively, you can follow the instructions in [alacritty-theme](https://github.com/alacritty/alacritty-theme) to download all themes at once and then choose one.

## Mappings

| Mappings                  | Action                 |
| ----------------------- | -------------------- |
| `Ctrl + Shift + c`      | Copy                 |
| `Ctrl + Shift + v`      | paste                 |
| `Ctrl + =`              | zoom in              |
| `Ctrl + -`              | zoom out             |
| `Super + Shift + Enter` | Open new terminal in current directory |


## References
- [How to install Alacritty Terminal on Ubuntu 22.04 LTS](https://linux.how2shout.com/how-to-install-alacritty-terminal-on-ubuntu-22-04-lts/) 
- [How to set Alacritty as Default Terminal in Ubuntu 22.04 or 20.04](https://linux.how2shout.com/how-to-set-alacritty-as-default-terminal-in-ubuntu-22-04-or-20-04/)
- [How to Use and Configure Alacritty (The Best Terminal Emulator)](https://youtu.be/76GbxnD8wnM?si=RybtMsHVJR3kQgEe)

