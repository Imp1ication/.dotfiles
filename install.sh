#!/bin/sh

DOT_DIR="$HOME/.dotfiles"
CONF_DIR="$HOME/.config"

#-- i3 --#
# i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb

echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt update
sudo apt install i3

ln -s "$DOT_DIR/i3" "$CONF_DIR/i3"

# bumblebee-status
if [ ! -d "i3/bumblebee-status" ]; then
	cd i3/
	git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git
	cd ..
else
	echo "i3/bumblebee-status already exists."
fi

# powermenu & wifimenu
sudo ln -s "$DOT_DIR/bin/powermenu" ~/.local/bin/powermenu
sudo ln -s "$DOT_DIR/bin/wifimenu" ~/.local/bin/wifimenu

# feh
sudo apt-get install feh

#-- betterlockscreen --#
cd betterlockscreen

# i3lock-color
if [ ! -d "i3lock-color" ]; then
	sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
	
	git clone https://github.com/Raymo111/i3lock-color.git
	cd i3lock-color
	
	sudo ./install-i3lock-color.sh
	cd ..
fi

# ImageMagick
sudo apt install imagemagick

# betterlockscreen
wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
unzip main.zip

cd betterlockscreen-main/
chmod u+x betterlockscreen
cp betterlockscreen /usr/local/bin/

cp system/betterlockscreen@.service /usr/lib/systemd/system/
systemctl enable betterlockscreen@$USER

cd ..
cd ..

ln -s "$DOT_DIR/betterlockscreen" "$CONF_DIR/betterlockscreen"

#-- Rofi --#
sudo apt install rofi

ln -s "$DOT_DIR/rofi" "$CONF_DIR/rofi"

#-- Alacritty --#
sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

ln -s "$DOT_DIR/alacritty" "$CONF_DIR/alacritty"

#-- fish shell --#
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish -y

chsh -s /usr/bin/fish

ln -s "$DOT_DIR/fish" "$CONF_DIR/fish"

#-- LunarVim
# fd-find & ripgrep
sudo apt-get install fd-find ripgrep

# xclip
sudo apt-get update
sudo apt-get install xclip

# Python3.9
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 -y

sudo apt update
sudo apt install python3-pip -y

python3 -m pip install --user --upgrade pynvim

# Ruby
sudo apt install ruby-full -y
sudo gem install neovim

# Node.js
cd ~
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install npm
sudo npm install -g neovim
cd $DOT_DIR

# Cargo
sudo snap install rustup --classic
rustup install stable
rustup default stable

# NeoVim
sudo snap install nvim --classic

# LunarVim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) -y -y -y

sudo rm -rf $CONF_DIR/lvim
ln -s "$DOT_DIR/lvim" "$CONF_DIR/lvim"

sudo rm ~/.local/bin/lvim
sudo ln -s "$DOT_DIR/bin/lvim" ~/.local/bin/lvim
