# GENERAL
export EDITOR='nvim'
HISTFILE=~/.zsh_history
SAVEHIST=1000

# enable vi mode
bindkey -v

# PLUGINS
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# THEMES
fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# FUNCTIONS

# add a directory to the front of the PATH if it's not already there
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

# init pyenv
function pyenv_init() {
    eval "$(pyenv init -)"
    # .scripts/venv_init is a script that creates a virtualenv if it doesn't exist
    venv_init
    pyenv activate $(cat .python-version)
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
addToPathFront "$HOMEBREW_PREFIX/opt/binutils/bin"

# fzf
source <(fzf --zsh)

# krew
addToPathFront "${KREW_ROOT:-$HOME/.krew}/bin"

# change sed to gnu-sed
addToPathFront "$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin"

# libpq (psql)
addToPathFront "$HOMEBREW_PREFIX/opt/libpq/bin"

# openssl
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl@1.1/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl@1.1/lib/pkgconfig"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# Not initializing pyenv because it's slow, instead use: script to activate it:
# pyenv_init
function venv_init() {
    if [ ! -d .venv ]; then
        uv venv
    fi
    source .venv/bin/activate
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init zsh)"

# ALIASES
alias oo="cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/vault_1"
alias ow="cd $HOME/work"
alias or="nvim $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/vault_1/inbox"

# SCRIPTS
addToPathFront $HOME/.scripts

# BINDINGS
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^g "dotfiles-quick-edit\n"
