function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    set -l git_branch
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
      set git_branch " $git_branch"
    end

    set current_dir (string replace -r '^'$HOME'($|/)' '~$1' $PWD)
    set -l current_dir (basename $current_dir)

    echo -n -s (set_color $color_cwd) ' ' ' ' $current_dir (set_color yellow) ' ' $git_branch $normal $suffix " "
end
