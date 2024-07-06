# GENERAL
export EDITOR='nvim'

# enable vi mode
bindkey -v

# PLUGINS
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# THEMES
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# FUNCTIONS
# open k9s with the given context
function k9ss() {
    k9s --context "$1-rke-$2-env" -c dp
}

# add a directory to the front of the PATH if it's not already there
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# yank the current command to the clipboard
function vi-yank-xclip {
    zle vi-yank
    echo "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip


# TOOLS
# homebrew
addToPathFront "/opt/homebrew/opt/binutils/bin"

# fzf
source <(fzf --zsh)

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
alias cf='nvim $(fd --hidden -E .git . ~/work/other/dotfiles | fzf --preview "cat {}")'

# SCRIPTS
addToPathFront $HOME/.scripts

# BINDINGS
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^g "cf\n"
