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

This configuration depends on the `Maple Mono NF CN` font.

To install the font:

1. Download the font from the official repository: [https://github.com/subframe7536/maple-font](https://github.com/subframe7536/maple-font)  
   or use my personal backup: [Google Drive link](https://drive.google.com/file/d/1AVruSP0orO9Qdof0KV_Fp0VCpWiU8m2M/view?usp=sharing)
2. Unzip the downloaded font archive.
3. Install the extracted font files to your system fonts directory.

If you prefer a different font, edit the `font` setting in `wezterm.lua` to specify your preferred font.
