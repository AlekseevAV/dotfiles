#!/usr/bin/env zsh

# Check if Homebrew is installed
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null ## /dev/null skips pressing enter for the installation
fi

# Update Homebrew
echo "Installing/updating Homebrew boundle..."
brew bundle --file=./homebrew/Brewfile

# Install App Store apps
echo "Installing App Store apps..."
mas install 904280696  # Things
mas install 1461845568 # Gifox
mas install 310633997  # WhatsApp

# Symlink dotfiles
echo "Symlinking dotfiles..."
stow -t ~ nvim
stow -t ~ scripts
stow -t ~ tmux
stow -t ~ wezterm
stow -t ~ zsh
stow -t ~ yazi
stow -t ~/Library/Application\ Support/k9s k9s
stow -t ~/Library/Application\ Support/lazygit lazygit

