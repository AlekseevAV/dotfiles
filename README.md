# Dotfiles

## Install

### Homebrew

[brew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Symlink dotfiles

I use [GNU Stow](https://www.gnu.org/software/stow/) to symlink my dotfiles.


```bash
# Install stow
brew install stow

# Clone this repo
git clone <this-repo>
cd dotfiles

# Symlink dotfiles
stow -t ~ nvim
stow -t ~ scripts
stow -t ~ tmux
stow -t ~ wezterm
stow -t ~ zsh
```

### Raycast

[Raycast](https://raycast.com/) is Spotlight alternative for MacOS.


### Terminal

[Wezterm](https://wezfurlong.org/wezterm/install/macos.html#installing-on-macos) - terminal emulator

```bash
brew install --cask wezterm
```


### Terminal Multiplexer

[Tmux](https://formulae.brew.sh/formula/tmux)

```bash
# Install tmux
brew install tmux

# Install tpm (tmux plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

To install plugins, press `prefix` + `I` (my `prefix` is `ctrl` + `a`)

### Shell

Zsh, theme, and plugins

```bash
brew install zsh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install pure
```

### Neovim and plugins

```bash
brew install neovim
brew install lazygit
```

### Tools
```bash
brew install fzf
brew install fd
brew install ripgrep
```

