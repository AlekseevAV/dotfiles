# Dotfiles

## Installation

### Raycast

[Raycast](https://raycast.com/)

### Homebrew

Install [brew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Homebrew packages

1. [Wezterm](https://wezfurlong.org/wezterm/install/macos.html#installing-on-macos) - terminal emulator
2. [Tmux](https://formulae.brew.sh/formula/tmux)
3. [Zsh](https://formulae.brew.sh/formula/zsh)
4. [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) - fish-like autosuggestions for zsh
5. [Pure (zsh theme)](https://github.com/sindresorhus/pure) - zsh theme
6. [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
7. [fd](https://github.com/sharkdp/fd?tab=readme-ov-file#installation) - search tool (alternative to find with better performance and more intuitive op
8. [ripgrep](https://github.com/BurntSushi/ripgrep) - search tool
9. [Stow](https://formulae.brew.sh/formula/stow) - dotfile manager
10. [Lazygit](https://formulae.brew.sh/formula/lazygit) - git client

```bash
brew install --cask wezterm
brew install tmux
brew install zsh
brew install zsh-autosuggestions
brew install zsh-vi-mode
brew install zsh-syntax-highlighting
brew install pure
brew install neovim
brew install fd
brew install ripgrep
brew install stow
brew install lazygit
```

### Other tools

1. Install [ow-my-zsh](https://ohmyz.sh/#install)


### Stow dotfiles

```bash
git clone <this-repo>
cd dotfiles

stow -t ~ nvim
stow -t ~ scripts
stow -t ~ tmux
stow -t ~ wezterm
stow -t ~ zsh
```
