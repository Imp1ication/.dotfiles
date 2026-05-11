#!/bin/bash

DOT_DIR="$HOME/.dotfiles"
CONF_DIR="$HOME/.config"
SYMLINK_DIRS=("nvim" "wezterm")

# Color setting
RCOL='\033[0m'
RED='\033[0;31m'
GRE='\033[0;32m'
YEL='\033[0;33m'

# Helper functions
function action_echo() {
    local color="$1"
    local action="$2"
    local text="$3"
    printf "%b %s\n" "${color}${action}${RCOL}" "${text}"
}

function confirm() {
    read -p "$1 [y/N] " ans
    [[ "$ans" == [Yy]* ]]
}

# symlinked to .config
for target in "${SYMLINK_DIRS[@]}"; do
    # Check if the target directory or symlink already exists
    if [ -d "$CONF_DIR/$target" ] || [ -L "$CONF_DIR/$target" ]; then
        if confirm "$CONF_DIR/$target already exists. Delete it?"; then
            action_echo ${RED} "deleting" "$CONF_DIR/$target..."
            rm -rf "$CONF_DIR/$target"
        else
            action_echo ${YEL} "skipping" "$CONF_DIR/$target..."
            echo # empty line
            continue
        fi
    fi

    # Create the symlink
    action_echo ${GRE} "symlinking" "$DOT_DIR/$target to $CONF_DIR/$target..."
    ln -sf "$DOT_DIR/$target" "$CONF_DIR/$target"
    echo # empty line
done
