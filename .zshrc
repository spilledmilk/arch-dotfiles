# Define
DOT=~/arch-dotfiles

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Enable completion
autoload -U compinit
compinit -i
zstyle ':completion:*' menu select
setopt menu_complete

# Enable colours
autoload -U colors && colors
setopt prompt_subst

# History
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTTIMEFORMAT="%h %d %H:%M:%S "

# Source
source $DOT/.bash_aliases

# Default editor
export EDITOR='vim'

# Configure oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=$DOT/.zsh-custom
ZSH_THEME="muse"
plugins=(colored-man-pages history-substring-search pip python ssh-agent zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

# Remotely add authorized ssh key
function rkey {
    if (( "$#" == 1 ))
        then
            ssh $1 'mkdir -p ~/.ssh && echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys'
    else
        echo "rkey takes one argument: rkey [user]@[host]"
    fi
}
