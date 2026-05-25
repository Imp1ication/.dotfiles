#!/bin/zsh

DOT_DIR="$HOME/.dotfiles"
CONF_DIR="$HOME/.config"

# 定義來源與目標的 mapping
typeset -A SYMLINK_MAP
SYMLINK_MAP[$DOT_DIR/nvim]=$CONF_DIR/nvim
SYMLINK_MAP[$DOT_DIR/wezterm]=$CONF_DIR/wezterm
SYMLINK_MAP[$DOT_DIR/Rime]=$HOME/Library/Rime
SYMLINK_MAP[$DOT_DIR/tmux/.tmux.conf]=$HOME/.tmux.conf
SYMLINK_MAP[$DOT_DIR/zsh/.zshrc]=$HOME/.zshrc
SYMLINK_MAP[$DOT_DIR/zsh/.p10k.zsh]=$HOME/.p10k.zsh

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
    read "ans?$1 [y/N] "
    [[ "$ans" == [Yy]* ]]
}

# 依 mapping 建立 symlink
for src dst in "${(@kv)SYMLINK_MAP}"; do
    if [ -d "$dst" ] || [ -L "$dst" ]; then
        if confirm "$dst already exists. Delete it?"; then
            action_echo ${RED} "deleting" "$dst..."
            rm -rf "$dst"
        else
            action_echo ${YEL} "skipping" "$dst..."
            echo
            continue
        fi
    fi
    action_echo ${GRE} "symlinking" "$src to $dst..."
    ln -sf "$src" "$dst"
    echo
done
