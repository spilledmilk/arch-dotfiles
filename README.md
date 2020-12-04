# Dotfiles: Arch Linux

## Overview

Greetings!

This is my Arch Linux and Oh-my-zsh setup, using KDE Plasma.

Check out these resources:

* [KDE Plasma](https://kde.org/plasma-desktop)
* [prestidigitation's Arch Linux Setup Guide](https://github.com/prestidigitation/arch-linux-sysadmin)
* [Oh-my-zsh](https://ohmyz.sh/)
* [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
* [alanchrt's Dotfiles](https://github.com/alanchrt/dotfiles) - A special thanks; inspiration for my dotfiles

Goodies you will need:

* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md)
* [romkatv's Powerlevel10k Theme](https://github.com/romkatv/powerlevel10k) - A wonderful, clean theme

Directories:

* `$HOME/builds` - For AUR packages and repository clones
* `$HOME/workspace` - For development projects
* Dotfiles should be in the `$HOME` directory

---

## User Guide

### Install Zsh & Oh-my-zsh

1. Install Zsh and git
   
        sudo pacman -S zsh git

2. Install Oh-my-zsh
    
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

3. Set Zsh as the default shell

        chsh -s $(which zsh)

4. Source .zshrc
    
        source ~/arch-dotfiles/.zshrc

<br/>

### Install Powerlevel10k theme
Check out the link to romkatv's repository to set things up, or follow the simplified version below. 

1. Install the Meslo Nerd Font, either from the linked "Nerd Fonts" site or [here from romkatv's repository](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

2. Clone the repository in the `$HOME/builds` folder
    
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/builds/powerlevel10k
        
        echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/arch-dotfiles/.zshrc

3. Source .zshrc to enable the theme
    
        source ~/arch-dotfiles/.zshrc

4. Configure the theme. If the configuration wizard doesn't show up automatically, type `p10k configure`.
   
   At the end of the configuration, it will ask if you want the wizard to add the required items to your .zshrc file. Say **no** -- this is already included in this dotfile's .zshrc file.

5. Updating the theme

        git -C ~/powerlevel10k pull

    After updating, restart Zsh. **Do not** source .zshrc.

To use an Oh-my-zsh theme, comment out the following line in the .zshrc file:

    source ~/powerlevel10k/powerlevel10k.zsh-theme

Then, to apply an Oh-my-zsh theme of your choosing, un-comment the following:

    source $ZSH/themes/muse.zsh-theme

You can find screenshots of the different themes and their respective names [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

Change the `muse.zsh-theme` to the one of your choice.

<br>

### Add zsh-syntax-highlighting

1. Clone the repository in the `$HOME/builds` folder

        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

2. The file that must be sourced from this repository is already included in this dotfile's .zshrc file. Simply source the .zshrc file to be done with this step.

        source ~/arch-dotfiles/.zshrc

The zsh-syntax-highlighting default highlighters should now be active, as the `ZSH_HIGHLIGHT_HIGHLIGHTERS` array is already in the .zshrc file. If you want to customise it further, check out the link from the top of the README for details.

---

## KDE Plasma Aesthetics & Settings

### Appearance
* **Global Theme**: Dracula, Edna
* **Plasma Style**: Dracula-kde, Rounded Dark, Moe-Dark
* **Application Style**: MS Windows 9x
* **Window Decorations**: Gently, Edna, Sweet-Dark
* **Colors**: Dracula, Edna
    
    * Selection Background: #693f99
    * Link Text: #00ffb7

* **Fonts**: Ubuntu 12pt, Roboto Mono Medium 12pt
* **Icons**: Papirus-Dark, BeautyLine
* **Emoticons**: Onigiri
* **Cursors**: Qogir Cursors - White

### Workspace
* **Login Screen (SDDM)**: Dracula
* **Splash Screen**: QuarksSplashDarker

### Hardware
* **Keyboard**: "Advanced" > "Configure keyboard options"

    * Caps Lock behavior => Make Caps Lock an additional Esc
    * Ctrl position => Swap Left Alt with Left Ctrl

### Task Manager Settings
* **Appearance**

    * Highlight windows when hovering over tasks
    * Mark applications that play audio
    * Maximum rows: 1

* **Behavior**

    * Group: By program name, Combine into single button
    * Sort: Alphabetically
    * On middle-click: None
    * Show only tasks: From current desktop, From current activity

* **Window Management**

    * Task Switcher

        * Show selected window
        * Large Icons
        * Shortcuts - All windows: Ctrl+Tab (Forward), Ctrl+Shift+Tab (Reverse)
        * Shortcuts - Current application: Alt+\` (Forward), Alt+Shift+\` (Reverse)

---

## System Settings

### Network
Network Manager is a useful GUI for selecting networks to connect to.

To enable the Network Manager once:

        sudo systemctl start NetworkManager.service

To enable the Network Manager at boot:

        sudo systemctl enable NetworkManager.service

### Bluetooth
If Bluetooth is not enabled, you can do so with the following command (start at boot):

        sudo systemctl enable bluetooth.service

To start once, immediately:

        sudo systemctl start bluetooth.service

### Printers
        
        sudo systemctl enable org.cups.cupsd.socket
        sudo systemctl enable org.cups.cupsd.service
        sudo systemctl start org.cups.cupsd.service
        sudo systemctl start avahi-daemon.service

---

## Other Useful Notes

### Git: Generating SSH Keys
* After following [Github's guide](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), copy the key from the `.id_rsa.pub` file.


### Aliases
* Obviously, some of the aliases in my `.bash_aliases` file will not be useful to you. Delete and keep what you'd like -- make it your own :)

### Themes
* If you ever want to modify an existing theme, add the modified file (different name than the original) to the `.zsh-custom/themes` folder. Then source that `.zsh-theme` file in .zshrc to apply the theme.

### Sublime
* Clone the repository in the `$HOME/builds` folder and install

        git clone https://aur.archlinux.org/sublime-text-dev.github
        cd [clone directory]
        makepkg -sic

* Open up Sublime and install Package Control: `Tools` > `Install Package Control...`

* Install packages listed in the *package-list.txt* file

* Copy *Preferences.sublime-settings* content into the Sublime User file with the same name (alias shown below)

        sublime-pref-dts

[Sublime Text Package Control package search page](https://packagecontrol.io/)

### Terminal

***Note:** You may need to configure your terminal preferences to run `source ~/arch-dotfiles/.zshrc` when the application starts.*

* [Tilda](https://github.com/lanoxx/tilda/) - Terminal emulator, such as Konsole
* [Colour palette ideas](https://github.com/lysyi3m/macos-terminal-themes)

![*Japanesque* colour palette](https://raw.githubusercontent.com/lysyi3m/macos-terminal-themes/master/screenshots/japanesque.png)

### Vim
* [vim-plug](https://github.com/junegunn/vim-plug/) - Manage Vim plugins

* To install Vim plugins:

        :source ~/arch-dotfiles/.vimrc
        :PlugInstall

**Cheatsheets**

Many thanks to [theicfire](https://github.com/theicfire/vimsheet) for these cheatsheets.
* [General](https://github.com/theicfire/vimsheet/blob/gh-pages/index.md)
* [Advanced](https://github.com/theicfire/vimsheet/blob/gh-pages/advanced.md)

### Privacy & Security
* [Restore Privacy](https://restoreprivacy.com/)
* [Firefox privacy modification guide](https://restoreprivacy.com/firefox-privacy/)
* [NordVPN - Arch Wiki](https://wiki.archlinux.org/index.php/NordVPN)

### Preferred Software
| Type              | Program               |
| :----------       | :-----------          |
| Browser           | Firefox, Brave        |
| Terminal          | Tilda, Konsole        |
| Terminal Editor   | Vim                   |
| File Manager      | Dolphin               |
| Password Manager  | KeePassXC             |
| Code Editor       | Sublime Text, VS Code |
| Music Player      | Sayonara              |
| Pixel Art         | Aseprite              |
| Chat              | Element (Riot)        |
| Cloud Storage     | pCloud                |
| VPN Client        | NordVPN               |
| File Protection   | NordLocker            |
| Screenshot        | Spectacle             |
| Converter: .deb   | debtap                |
| YT Download       | youtube-dl-git        |

[Official Arch Packages](https://www.archlinux.org/packages/)

* To install:

        sudo pacman -S [package_name]

* Updates when updating the system:

        sudo pacman -Syu

[Arch User Repository](https://aur.archlinux.org/packages/)

* To install:

        git clone [git-clone-url]
        cd [clone-directory]
        makepkg -sic

* To update:
        
        cd [clone-directory]
        git pull
        makepkg -sic

### To Check Out Later
* [Spacemacs](https://www.spacemacs.org/doc/DOCUMENTATION.html)
