# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# setup language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

unsetopt HIST_VERIFY

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- alias ---- #
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# ---- Eza (better ls) ---- #
alias ls="eza --icons=always"
alias tree="eza --icons=always --sort=type --tree"

# ---- cowsay ---- #
alias cowsay="cowsay -f stegosaurus"

# ---- lazygit, lazydocker ---- #
alias lzg="lazygit"
alias lzd="lazydocker"

# ---- FZF ---- #
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# ---- thefuck ---- #
eval $(thefuck --alias fk)

# ---- copilot ---- #
alias ai='nvim +CodeCompanionChat +only'

# ---- dadbod ---- #
alias db="nvim +DBUI"

# ---- current time ---- #
current_time() {
  local CYAN='\033[0;36m'
  local GREEN='\033[0;32m'
  local NC='\033[0m' # 無顏色

  local time
  time=$(date '+%Y-%m-%dT%H:%M:%S')

  echo "${CYAN}Current time is: ${NC}${time}"
  echo -n "$time" | pbcopy
  echo "${GREEN}Copied to clipboard.${NC}"
}
alias ct=current_time

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# ---- Dev Environment Setup ---- #
