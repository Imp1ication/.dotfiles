# Zsh Configuration

This directory contains configuration files for [Zsh](https://www.zsh.org/), a powerful and highly customizable shell for Unix-like operating systems.

## Contents

- `.zshrc`: Main Zsh configuration file, including aliases, environment variables, plugin sources, and theme settings.
- `.p10k.zsh`: Personal configuration for the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt theme.

## Installation

1. Install Zsh (if not already installed)

On macOS, Zsh is pre-installed. To ensure you have the latest version, use Homebrew:

```
brew install zsh
```

2. Install Recommended Plugins and Tools

This configuration uses several zsh plugins. Install them with Homebrew:

```
brew install zsh-autosuggestions zsh-syntax-highlighting
```

For Powerlevel10k theme:

```
brew install romkatv/powerlevel10k/powerlevel10k
```

3. Install Powerlevel10k Font

For best appearance, install a [Nerd Font](https://www.nerdfonts.com/).

This configuration uses the `Maple Mono NF CN` font.

To install the font:

- Download the font from the official repository: [https://github.com/subframe7536/maple-font](https://github.com/subframe7536/maple-font)  
   or use my personal backup: [Google Drive link](https://drive.google.com/file/d/1AVruSP0orO9Qdof0KV_Fp0VCpWiU8m2M/view?usp=sharing)
- Unzip the downloaded font archive.
- Install the extracted font files to your system fonts directory.

After installing, set your terminal emulator to use font to ensure correct icon and symbol display in Powerlevel10k.

4. Symlink Configuration Files

Symlink the `.zshrc` and `.p10k.zsh` from your dotfiles to your home directory:

```
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
```

## Dependencies

This configuration depends on several additional tools. Install them with Homebrew:

```
brew install fzf eza lazygit lazydocker cowsay thefuck
```

#### Tool List and Usage

- **fzf**: Command-line fuzzy finder.
- **eza**: Modern replacement for `ls` and `tree`.
- **lazygit**: Simple terminal UI for git commands.
- **lazydocker**: Simple terminal UI for docker and docker-compose.
- **cowsay**: The best `echo` ever, with your messages delivered by a talking ASCII stegosaurus.
- **thefuck**: Instantly fixes your last typo-ridden command when you mess up.

#### Custom Aliases and Functions

| Alias / Function             | Description                                                      |
| ---------------------------- | ---------------------------------------------------------------- |
| `..`, `...`, `....`, `.....` | Quickly change to parent directories (`cd ..`, `cd ../..`, etc.) |
| `ls`                         | Use `eza` as a replacement for `ls` with icons                   |
| `tree`                       | Use `eza` to display directory tree with icons and type sorting  |
| `cowsay`                     | Display messages using the stegosaurus ASCII art                 |
| `lzg`                        | Launch `lazygit`                                                 |
| `lzd`                        | Launch `lazydocker`                                              |
| `fk`                         | Use `thefuck` to fix the previous mistyped command               |
| `ct` / `current_time`        | Show the current time and copy it to the clipboard               |
| `ai`                         | Open Neovim and enter CodeCompanionChat                          |
| `db`                         | Open Neovim and enter DBUI                                       |

## Theme

The prompt is configured with Powerlevel10k. To customize, run:

```
p10k configure
```

or edit `.p10k.zsh` directly.

## Notes

- If you add sensitive environment variables (API keys, credentials, etc.), keep them in a separate file (e.g., `.zshrc.local`) and add that file to `.gitignore`.
- For best results, use a terminal that supports Nerd Fonts and true color (e.g., WezTerm, iTerm2, Alacritty).
- After changing `.zshrc` or `.p10k.zsh`, reload your shell or run `source ~/.zshrc`.
