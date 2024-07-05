# OH-MY-ZSH & PLUGINS
export ZSH="/Users/aleksandr.alekseev/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(
  git
  vi-mode
)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' autosuggest-accept

# THEMES
ZSH_THEME="robbyrussell"

# Pure theme
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure


# FUNCTIONS
function k9ss() {
    k9s --context "$1-rke-$2-env" -c dp
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}


# GENERAL
export EDITOR='nvim'

addToPathFront "/opt/homebrew/opt/binutils/bin"


# TOOLS

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# krew
addToPathFront "${KREW_ROOT:-$HOME/.krew}/bin"

# change sed to gnu-sed
addToPathFront "/opt/homebrew/opt/gnu-sed/libexec/gnubin"

# libpq (psql)
addToPathFront "/opt/homebrew/opt/libpq/bin"

# openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || addToPathFront "$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# ALIASES
# Obsidian
alias oo='cd $HOME/library/Mobile\ Documents/iCloud~md~obsidian/Documents/vault_1'
alias or='nvim $HOME/library/Mobile\ Documents/iCloud~md~obsidian/Documents/vault_1/inbox'

# Quick config editing
alias cf='nvim $(find $HOME/.config/nvim $HOME/.scripts $HOME/.tmux.conf $HOME/.zshrc $HOME/.wezterm.lua | fzf --preview "cat {}")'


# SCRIPTS
addToPathFront $HOME/.scripts
bindkey -s ^f "tmux-sessionizer\n"

