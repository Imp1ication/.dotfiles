# WezTerm Configuration

This directory contains the configuration file for [WezTerm](https://wezfurlong.org/wezterm/), a GPU-accelerated terminal emulator and multiplexer.

## Contents

- `wezterm.lua`: Main configuration file with custom appearance, font, and key bindings.

## Custom Key Bindings

- `CMD + N`: Opens a new WezTerm window.

## Installation

1. Install WezTerm using Homebrew:

```
brew install --cask wezterm
```

2. Symlink the `wezterm` directory from your dotfiles to your config directory:

```
ln -sf ~/.dotfiles/wezterm ~/.config/wezterm
```

## Dependencies

This configuration depends on the `Maple Mono NF CN`.

To install the font:

1. Unzip the font archive located in `.dotfiles/MapleMono-NF-CN.zip`
2. Install the extracted font files to your system fonts directory.

If you prefer a different font, edit the `font` setting in `wezterm.lua` to specify your preferred font.
