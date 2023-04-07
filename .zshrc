# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git

    # Install git-open as zsh plugins before using it.
    # Run 'git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open'
    # https://github.com/paulirish/git-open
    git-open
)

# Alias
alias c="clear"
alias ll='ls -lht'
alias la='ls -lhta'

# Create sub-directories
alias mkdir='mkdir -p'

alias now='date "+%Y-%m-%d %H:%M:%S"'

# IP adress
alias ipe='curl ipinfo.io/ip'

# History search)
# Requires peco
# https://github.com/peco/peco
function peco-history-selection() {
    BUFFER="$(\history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh