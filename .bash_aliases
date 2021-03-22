# .bash_aliases - Jane Kim
# https://spilledmilk.github.io


#####################################################################
#============================= System ==============================#
#####################################################################

# ls
alias ls='ls -G --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la'

# Dot
alias va='vim ~/arch-dotfiles/.bash_aliases'
alias vz='vim ~/arch-dotfiles/.zshrc'
alias vb='vim ~/arch-dotfiles/.bash_profile'

# Directory
alias dot='cd ~/arch-dotfiles'
alias dev='cd ~/workspace'

# Editor
alias v='vim'

# Tree colorisation
alias tree='tree -C'

# Command line
alias c='clear'
alias u='cd ..'
alias u2='cd ../..'
alias u3='cd ../../..'

# Source
alias sa='source ~/arch-dotfiles/.bash_aliases'
alias sb='source ~/arch-dotfiles/.bash_profile'
alias sz='source ~/arch-dotfiles/.zshrc'

# Vim
alias cv='cp ~/arch-dotfiles/.vimrc ~/.vimrc'

# Linux
alias enw='sudo systemctl enable NetworkManager.service'
alias sbt='sudo systemctl start bluetooth.service'
alias remove='sudo pacman -Rns'
alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias make='makepkg -sic'
alias bt-reset='sudo rfkill block bluetooth && sleep 0.1 && sudo rfkill unblock bluetooth'

# School
alias uiscad='ssh jlund6@uisacad5.uis.edu'
alias uisvpn='sudo openconnect https://vpn.uis.edu'

function ja {
  filename=$@
  javac $filename.java &&
    java $filename
 }

# Sublime Text
alias edit='subl'
alias sublime-pref-dts='cp ~/arch-dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings'
alias sublime-pref-std='cp ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/arch-dotfiles/sublime/Preferences.sublime-settings'
alias sublime-pkg-std='cp ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings ~/arch-dotfiles/sublime/packages-list.txt'

# Youtube DL
alias ytdl='youtube-dl --no-cache-dir -i --extract-audio --audio-format mp3' #youtube link
alias ytdl-u='sudo -H pip install --upgrade youtube-dl'

# Toggle Xcompmgr
function xcm {
  if pgrep xcompmgr &>/dev/null; then
    echo "Turning xcompmgr OFF"
    pkill xcompmgr &
  else
    echo "Turning xcompmgr ON"
    xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
  fi

  exit 0
}

#####################################################################
#=========================== Code tools ============================#
#####################################################################

# Git
alias g='git'
alias gad='git add'
alias gcm='git commit -m'
alias gcl='git clone'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gdm='git branch -d' #delete merged branch
alias gdu='git branch -D' #delete unmerged branch
alias gb='git branch'
alias gd='git diff --color'
alias gi='git init'
alias gpo='git push origin'
alias gp='git pull'
alias gs='git status'
alias gm='git merge'
alias grm='git rebase master'
alias gst='git stash'
alias gsta='git stash apply'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -C%(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gdt='git difftool'

# Python
alias py='python'
alias pi='pip install --user --install-option="--prefix="' #[package_name]

# Node
alias ns='node server'
alias nds='node-dev server'

# Ngrok
alias ng='./ngrok'
alias ng80='./ngrok http 80'
alias actl='sudo apachectl start'


######################################################################
#============================== Acuity ==============================#
######################################################################

# Codebase
alias acuity='cd ~/workspace/acuity'
alias ac-start='~/workspace/acuity/docker/development.sh -a start'
alias ac-restart='~/workspace/acuity/docker/development.sh -a restart'
alias ac-gulp='~/workspace/acuity/docker/development.sh -a gulp-watch'
alias ac-logs='~/workspace/acuity/docker/development.sh -a logs -f acuity-web'
alias ad-status='~/workspace/acuity/docker/development.sh -a status'
alias ad-stop='~/workspace/acuity/docker/development.sh -a stop'
alias ad-start='~/workspace/acuity/docker/development.sh -a start'
alias ad-migrate='~/workspace/acuity/docker/development.sh -a migrate'
alias csp-build='~/workspace/acuity/docker/development.sh -a build'

# Functional testing
alias ac-api="./docker/development.sh -a test -t test-api -p '-g /me'"
alias ac-oauth="./tests/functional/run mocha -g '/oauth2'"
