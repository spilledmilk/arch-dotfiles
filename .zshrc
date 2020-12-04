# .zshrc - Jane Kim
# https://spilledmilk.github.io

# Powerlevel10k Theme
# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc file.
# Initialization code that my require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source p10k theme 
#source ~/builds/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# To update, run `git -C ~/powerlevel10k pull`, then restart Zsh;
# do not source .zshrc.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Spaceship Theme
# To install, get latest from AUR package
# spaceship-prompt-git
autoload -U promptinit; promptinit
prompt spaceship

#======================================================================================#
#======================================================================================#
#======================================================================================#

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
export ZSH_CUSTOM="$DOT/.zsh-custom"
plugins=(colored-man-pages history-substring-search pip python ssh-agent poetry)
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source $HOME/builds/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Theme
source $ZSH_CUSTOM/themes/spaceship.zsh-theme
ZSH_THEME="spaceship"

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
