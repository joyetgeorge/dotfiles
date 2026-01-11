## Directory Overview

This repository contains personal configuration files (dotfiles) for a development environment on macOS. The configurations cover shell, terminal, text editor, and various development tools.

## Key Files

Here's a breakdown of the most important configuration files:

*   **`.zshrc`**: The main configuration file for the Zsh shell.
    *   Initializes Oh My Zsh and several plugins (`git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-fzf-history-search`).
    *   Sets `nvim` as the default editor.
    *   Configures the Starship prompt.
    *   Includes several useful aliases and functions, particularly for managing Git worktrees (`wt`, `wtdone`, `wtl`, `wts`, `wtd`).
    *   Integrates `nvm` for Node.js version management and `zoxide` for directory navigation.

*   **`.config/nvim/init.lua`**: The entry point for the Neovim configuration.
    *   Uses `lazy.nvim` for plugin management.
    *   Based on NvChad v2.5, with custom plugins and configurations in the `lua/plugins/` directory.
    *   Loads custom options, autocommands, and LSP settings.

*   **`.config/alacritty/alacritty.toml`**: Configuration for the Alacritty terminal emulator.
    *   Sets the font to "JetBrainsMono Nerd Font".
    *   Defines a custom color scheme.
    *   Configures the shell to launch `tmux` automatically.
    *   Includes custom keyboard bindings.

*   **`.config/starship.toml`**: Configuration for the Starship cross-shell prompt.
    *   Customizes the symbols for various tools and programming languages.
    *   Defines custom symbols for different operating systems.

*   **`.tmux.conf`**: Configuration for the tmux terminal multiplexer.
    *   Sets `C-a` as the prefix key.
    *   Defines keybindings for splitting panes, resizing, and navigating.
    *   Enables mouse support.
    *   Uses `tpm` (Tmux Plugin Manager) to manage plugins, including `vim-tmux-navigator`, `tmux-resurrect`, and `tmux-continuum`.

*   **`scripts/update-alacritty-icon.sh`**: A shell script to replace the default Alacritty application icon with a custom one.

*   **`.gitconfig`**: The global Git configuration file.
    *   Sets the user's name and email.
    *   Configures `delta` as the diff tool with a custom theme.

*   **`.config/yabai/yabairc`**: Configuration for `yabai`, a tiling window manager for macOS.
    *   Sets the default layout to `bsp`.
    *   Configures window gaps and padding.
    *   Enables mouse-follows-focus.

*   **`.config/lazygit/config.yml`**: Configuration for `lazygit`, a terminal UI for Git.
    *   Customizes the theme and layout.
    *   Sets `delta` as the pager.
    *   Enables auto-fetching and signing off on commits.

## Usage

These dotfiles are managed with GNU Stow. To use them, you would typically clone this repository to your home directory and then run `stow .` to create symbolic links from the files in this repository to their corresponding locations in your home directory.

For example, `stow` would create a symbolic link from `~/.dotfiles/.zshrc` to `~/.zshrc`.
