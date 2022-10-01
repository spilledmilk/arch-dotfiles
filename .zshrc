# .zshrc - Jane Kim
# https://spilledmilk.github.io

# PATH config
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin"

#======================================================================================#
#======================================================================================#
#======================================================================================#

# Spaceship Theme
# To install, get latest from AUR package
# spaceship-prompt-git
source /usr/lib/spaceship-prompt/spaceship.zsh

#======================================================================================#
#======================================================================================#
#======================================================================================#

# Source stuff
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Define stuff
DOT=~/arch-dotfiles

# Default editor
export EDITOR='vim'

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Enable completion
autoload -Uz compinit promptinit
compinit -i
promptinit
zstyle ':completion:*' menu select
setopt menu_complete
setopt COMPLETE_ALIASES

# Enable colours
autoload -U colors && colors
setopt prompt_subst

# History stuff
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTTIMEFORMAT="%h %d %H:%M:%S "

# Variables
export BROWSER="firefox"
export EDITOR="/usr/bin/vim"

# Load any environment variables
if [ -f ~/.env_variables ]; then
	source ~/.env_variables
fi

# Load aliases
source $DOT/.bash_aliases

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Load secrets
[[ -f "$DOT/.env_secrets" ]] && source "$DOT/.env_secrets"

# Execute .bash_local
if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

# Ruby
# rbenv
eval "$(rbenv init -)"

# nvm
source /usr/share/nvm/init-nvm.sh

# Remotely add authorized ssh key
function rkey {
    if (( "$#" == 1 ))
        then
            ssh $1 'mkdir -p ~/.ssh && echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys'
    else
        echo "rkey takes one argument: rkey [user]@[host]"
    fi
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
