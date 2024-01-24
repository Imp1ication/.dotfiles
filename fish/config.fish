#-- Setup --#
# key bindings mode
fish_default_key_bindings # fish_vi_key_bindings

set fish_greeting


# set -g fish_prompt_pwd_dir_length 1
set -g fish_prompt_pwd_full_dirs 1

#-- Funtions bindings--#
# fish bang bang
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end


#-- Aliases --#
# navigation
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias c='clear'

#-- Environment --#
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

