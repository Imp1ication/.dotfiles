# Tmux Configuration

This directory contains the configuration file for [tmux](https://github.com/tmux/tmux), a terminal multiplexer that allows for multiple terminal sessions within a single window.

## Contents

- `.tmux.conf`: Main configuration file with custom key bindings, appearance, and plugin settings.

## Installation

1. Install Tmux on macOS

Install tmux using Homebrew:

```
brew install tmux
```

2. Install Tmux Plugin Manager (TPM)

Clone TPM to the default plugins directory:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3. Symlink the Configuration File

Symlink the `.tmux.conf` from your dotfiles to your home directory:

```
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## Plugins

This configuration uses the following plugins (managed by TPM):

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm): Tmux Plugin Manager
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and Vim splits  
  **Note:** To enable navigation between tmux and Vim, you also need to install the corresponding [vim-tmux-navigator Vim plugin](https://github.com/christoomey/vim-tmux-navigator) in your Vim or Neovim configuration.
- [tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect): Restore tmux environment after system restart
- [tmux-plugins/tmux-continuum](https://github.com/tmux-plugins/tmux-continuum): Continuous saving of tmux environment
- [niksingh710/minimal-tmux-status](https://github.com/niksingh710/minimal-tmux-status): Minimal status bar theme

## Installing Plugins

1. Start a new tmux session:

```
tmux
```

2. Press `prefix` + `I` (default prefix is `Ctrl` + `a` in this config) to install all plugins.

## Custom Key Bindings

- `Ctrl + a`: Tmux prefix key
- `v`: Split window horizontally
- `s`: Split window vertically
- `r`: Reload tmux configuration
- Arrow keys with prefix: Resize panes
- `m`: Toggle pane zoom
