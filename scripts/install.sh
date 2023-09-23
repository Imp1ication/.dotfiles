#!/bin/bash

set -e

source setup.sh

#-- Functions --#
function check_command() {
    if command -v $1 >/dev/null 2>&1; then
        color_echo ${Gre} "$1 already installed."
        return 0
    else
        return 1
    fi
}

#-- Dependencies --#
# apt-get dependencies
action_echo ${Cya} "Checking" "fd-find..."
if ! check_command "fdfind"; then
    action_echo ${Gre} "Installing" "fd-find..."
    sudo apt-get install fd-find
    color_echo ${Gre} "fd-find installed."
fi
echo #empty line
    
action_echo ${Cya} "Checking" "ripgrep..."
if ! check_command "rg"; then
    action_echo ${Gre} "Installing" "ripgrep..."
    sudo apt-get install ripgrep
    color_echo ${Gre} "ripgrep installed."
fi
echo #empty line

action_echo ${Cya} "Checking" "xclip..."
if ! check_command "xclip"; then
    action_echo ${Gre} "Installing" "xclip..."
    sudo apt-get install xclip
    color_echo ${Gre} "xclip installed."
fi
echo #empty line

# Python dependencies
action_echo ${Cya} "Checking" "Python dependencies..."
if ! check_command "python3.10"; then
    action_echo ${Gre} "Installing" "Python3.10..."
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get install python3.10 -y
    color_echo ${Gre} "Python3.10 installed."
fi

if ! check_command "pip"; then
    action_echo ${Gre} "Installing" "pip..."
    sudo apt-get install python3-pip -y
    color_echo ${Gre} "pip installed."
fi

if python3 -m pip show pynvim >/dev/null 2>&1; then
    color_echo ${Gre} "pynvim already installed."
else
    action_echo ${Gre} "Installing" "pynvim..."
    python3 -m pip install --user --upgrade pynvim
    color_echo ${Gre} "pynvim installed."
fi

if python3 -m pip show psutil >/dev/null 2>&1; then
    color_echo ${Gre} "psutil already installed."
else
    action_echo ${Gre} "Installing" "psutil..."
    python3 -m pip install --user --upgrade psutil
    color_echo ${Gre} "psutil installed."
fi
echo #empty line

# Ruby dependencies
action_echo ${Cya} "Checking" "Ruby dependencies..."
if ! check_command "ruby"; then
    action_echo ${Gre} "Installing" "Ruby..."
    sudo apt-get install ruby-full -y
    color_echo ${Gre} "Ruby installed."
fi

if ! check_command "gem"; then
    action_echo ${Gre} "Installing" "gem..."
    sudo apt-get install rubygems -y
    color_echo ${Gre} "gem installed."
fi

if gem list -i neovim >/dev/null 2>&1; then
    color_echo ${Gre} "neovim gem already installed."
else
    action_echo ${Gre} "Installing" "gem neovim..."
    sudo gem install neovim
    color_echo ${Gre} "gem neovim installed."
fi
echo #empty line

# Node.js dependencies
action_echo ${Cya} "Checking" "Node.js dependencies..."
if ! check_command "node"; then
    action_echo ${Gre} "Installing" "Node.js..."
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    
    sudo apt-get update
    sudo apt-get install nodejs -y
    color_echo ${Gre} "Node.js installed."

    action_echo ${Gre} "Installing" "npm neovim..."
    sudo npm install -g neovim
    color_echo ${Gre} "npm neovim installed."
fi
echo #empty line

# Cargo dependencies
action_echo ${Cya} "Checking" "Cargo dependencies..."
if ! check_command "cargo"; then
    action_echo ${Gre} "Installing" "Cargo dependencies..."
    sudo snap install rustup --classic
    rustup install stable
    rustup default stable
    color_echo ${Gre} "Cargo dependencies installed."
fi
echo #empty line

#-- i3 --#
# i3
action_echo ${Cya} "Checking" "i3..."
if ! check_command "i3"; then
    action_echo ${Gre} "Installing" "i3..."

    /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
    sudo apt-get install ./keyring.deb

    echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

    sudo apt-get update
    sudo apt-get install i3 -y

    color_echo ${Gre} "i3 installed."
fi
echo #empty line

# bumblebee-status
action_echo ${Cya} "Checking" "bumblebee-status..."
if [ -d "$DOT_DIR/i3/bumblebee-status" ]; then
    color_echo ${Gre} "bumblebee-status already exists."
else
    action_echo ${Gre} "Installing" "bumblebee-status..."
    cd $DOT_DIR/i3/
 	git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git
    cd $DOT_DIR
    color_echo ${Gre} "bumblebee-status installed."
fi
echo #empty line

# feh
action_echo ${Cya} "Checking" "feh..."
if ! check_command "feh"; then
    action_echo ${Gre} "Installing" "feh..."
    sudo apt-get install feh -y
    color_echo ${Gre} "feh installed."
fi
echo #empty line

#-- betterlockscreen --#
bls_dir="$DOT_DIR/betterlockscreen"

# i3lock-color
action_echo ${Cya} "Checking" "i3lock-color..."
if [ -d "$bls_dir/i3lock-color" ]; then
    color_echo ${Gre} "i3lock-color already exists."
else
    action_echo ${Gre} "Installing" "i3lock-color..."
 	sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
    cd $bls_dir
 	git clone https://github.com/Raymo111/i3lock-color.git
    
    cd $bls_dir/i3lock-color
    sudo ./install-i3lock-color.sh
    cd $DOT_DIR
    color_echo ${Gre} "i3lock-color installed."
fi
echo #empty line

# ImageMagick
action_echo ${Cya} "Checking" "ImageMagick..."
if ! check_command "convert"; then
    action_echo ${Gre} "Installing" "ImageMagick..."
    sudo apt-get install imagemagick -y
    color_echo ${Gre} "ImageMagick installed."
fi
echo #empty line

# betterlockscreen
action_echo ${Cya} "Checking" "betterlockscreen..."
if ! check_command "betterlockscreen"; then
    action_echo ${Gre} "Installing" "betterlockscreen..."
    cd $bls_dir
    wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip
    unzip main.zip

    cd betterlockscreen-main/
    chmod u+x betterlockscreen
    sudo cp betterlockscreen /usr/local/bin/

    sudo cp system/betterlockscreen@.service /usr/lib/systemd/system/
    systemctl enable betterlockscreen@$USER

    betterlockscreen -u "$DOT_DIR/i3/wallpaper.png" --fx blur
    cd $DOT_DIR

    color_echo ${Gre} "betterlockscreen installed."
fi
echo #empty line
    
#-- Rofi --#
action_echo ${Cya} "Checking" "Rofi..."
if ! check_command "rofi"; then
    action_echo ${Gre} "Installing" "Rofi..."
    sudo apt-get install rofi -y
    color_echo ${Gre} "Rofi installed."
fi
echo #empty line

#-- Alacritty --#
action_echo ${Cya} "Checking" "Alacritty..."
if ! check_command "alacritty"; then
    action_echo ${Gre} "Installing" "Alacritty..."
    sudo apt-get update
    sudo add-apt-repository ppa:aslatter/ppa -y
    sudo apt-get install alacritty -y
    color_echo ${Gre} "Alacritty installed."
fi

# check if alacritty is default terminal
if [ "$(gsettings get org.gnome.desktop.default-applications.terminal exec)" != "'alacritty'" ]; then
    action_echo ${Gre} "Setting" "Alacritty as default terminal..."
    gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'
    color_echo ${Gre} "Alacritty set as default terminal."
fi
echo #empty line

#-- fish shell --#
action_echo ${Cya} "Checking" "fish shell..."
if ! check_command "fish"; then
    action_echo ${Gre} "Installing" "fish shell..."
    sudo add-apt-repository ppa:fish-shell/release-3
    sudo apt-get update
    sudo apt-get install fish -y
    color_echo ${Gre} "fish shell installed."
fi

if [ "$(echo $SHELL)" != "/usr/bin/fish" ]; then
    action_echo ${Gre} "Setting" "fish shell as default shell..."
    chsh -s /usr/bin/fish
    color_echo ${Gre} "fish shell set as default shell."
fi
echo #empty line

#-- LunarVim --#
action_echo ${Cya} "Checking" "Neovim..."
if ! check_command "nvim"; then
    action_echo ${Gre} "Installing" "Neovim..."
    sudo snap install nvim --classic
    color_echo ${Gre} "Neovim installed."
fi
echo #empty line

action_echo ${Cya} "Checking" "LunarVim..."
if [ -d "$HOME/.local/share/lunarvim" ]; then
    color_echo ${Gre} "LunarVim already installed."
else
    action_echo ${Gre} "Installing" "LunarVim..."
    LV_BRANCH='release-1.3/neovim-0.9'
    curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/$LV_BRANCH/utils/installer/install.sh > /tmp/lv_installer.sh
    bash /tmp/lv_installer.sh
    rm /tmp/lv_installer.sh
    color_echo ${Gre} "LunarVim installed."
fi
echo #empty line

echo "Done!"
echo "Please run symlink.sh to create symlinks."
