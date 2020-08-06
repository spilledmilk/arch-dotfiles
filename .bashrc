# .bashrc - Jane Kim
# https://spilledmilk.github.io

# No history duplicates and forget commands prefixed by spaces
HISTCONTROL=ignoredups:ignorespace

# Append lines to history and set window title
shopt -s histappend

# Include shell environment
if [ -f ~/.shenv ]; then
    . ~/.shenv
fi

# Enable programmable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Execute .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
