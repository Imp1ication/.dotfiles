#!/bin/bash

# variables
DOT_DIR=~/.dotfiles
CONF_DIR=~/.config
BIN_DIR=~/.local/bin
LOG_DIR="$DOT_DIR/install_log.txt"

# colors
Rcol='\033[0m'
Red='\033[0;31m'
Gre='\033[0;32m'
Yel='\033[0;33m'
Cya='\033[0;36m'

# .config dir list
dir_list=(
    "i3"
    "betterlockscreen"
    "rofi"
    "alacritty"
    "fish"
    "nvim"
    "lvim"
)

# bin file list
bin_list=(
    "powermenu"
    "wifimenu"
    "lvim"
)

# functions
function confirm() {
    local question="$1"
    while true; do
        echo "$question"
        read -p "[y]es or [n]o (default: no) : " -r ans

        case "$ans" in
            y | Y | yes | Yes | YES)
                return 0
                ;;
            n | N | no | No | NO | *[[:blank:]]* | "")
                return 1
                ;;
            *)
                echo "Please answer yes or no."
                ;;
        esac
    done        
}

function color_echo() {
    local color="$1"
    local text="$2"
    echo -e "${color}${text}${Rcol}"
}

function action_echo() {
    local color="$1"
    local action="$2"
    local text="$3"
    echo -e "${color}${action}${Rcol} ${text}"
}
