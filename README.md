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

Directories:

* `$HOME/workspace` - For development projects
* Dotfiles should be in the `$HOME` directory

---

## User Guide

### Install Zsh & Oh-my-zsh

1. Install Zsh and git
   
        sudo pacman -S zsh git

2. Set Zsh as the default shell

        chsh -s $(which zsh)

3. Source .zshrc
    
        source ~/arch-dotfiles/.zshrc

4. Run `install.sh` file to create symbolic link

        chomod +x install.sh
        ./install.sh

<br/>

### Install yay
[yay](https://github.com/Jguer/yay) is a build tool for Arch, AUR.

1. Install `base-devel` first

        sudo pacman -S --needed base-devel

3. Use the `yay -S {package_name}` command to install the AUR packages listed in the `yay/packages.txt` file

<br/>

### Spaceship theme

1. If you want to install this theme a different way than I did, go to [the official website](https://denysdovhan.com/spaceship-prompt/) and follow the instructions there. Otherwise, read on!

2. Install the theme using [yay](https://github.com/Jguer/yay):

        yay -S spaceship-prompt 


3. Source the `.zshrc` file for the theme to take effect

<br/>

### Add zsh-syntax-highlighting

1. Install using [yay](https://github.com/Jguer/yay)

        yay -S zsh-syntax-highlighting-git

2. Restart zsh

---

## KDE Plasma Aesthetics & Settings

### Appearance
* **Global Theme**: Matcha-sea, cherry 
* **Plasma Style**: cherry
* **Application Style**: Breeze
* **GNOME/GTK Application Style**: Trollwut (Pink, Orange)
* **Window Decorations**: Matcha-sea
* **Colors**: MatchaSeaDark


* **Fonts**: Cantarell, Source Code Pro Medium
* **Icons**: candy-icons, Flatery-Dark
* **Emoticons**: Onigiri
* **Cursors**: Bibata-Modern-Amber
* **Splash Screen**: QuarksSplashDark

### Workspace
* **Login Screen (SDDM)**: Slice

### Hardware
* **Keyboard**: "Advanced" > "Configure keyboard options"

    * Caps Lock behavior => Make Caps Lock an additional Esc
    * Ctrl position => Swap Left Alt with Left Ctrl

### Window Management
* **Task Switcher**: Large icons
* **Behavior**:

    * Group: By program name, Combine into single button
    * Sort: Alphabetically
    * On middle-click: None
    * Show only tasks: From current desktop, From current activity
    * Mark applications that play audio
    * Maximum rows: 1

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
        
        sudo systemctl enable cups.service
        sudo systemctl start cups.service
        sudo systemctl start avahi-daemon.service

---

## Other Useful Notes

### Git: Generating SSH Keys
* After following [Github's guide](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), copy the key from the `.id_rsa.pub` file.


### Aliases
* Obviously, some of the aliases in my `.bash_aliases` file will not be useful to you. Delete and keep what you'd like -- make it your own :)

### Jetbrains
* See `settings/jetbrains/` directory for packages for Jetbrains products. This requires a paid subscription.

### Sublime
[Sublime Text Package Control package search page](https://packagecontrol.io/)

* Install using yay

        yay -S sublime-text-dev

* Open up Sublime and install Package Control: `Tools` > `Install Package Control...`

* Install packages listed in the `settings/sublime/packages-list.txt` file

* Copy `Preferences.sublime-settings` content into the Sublime User file with the same name (alias shown below)

        sublime-pref-dts

### Visual Studio Code
* Install using yay

        yay -S visual-studio-code-bin

* Install extensions from `settings/vscode/extensions.txt`. This goes through each extension in the file and installs the extension.

        cat vscode/extensions.txt | xargs -n 1 code --install-extension

* To back-up extensions in the future, use the following command

        code --list-extensions >> vscode/extensions.txt

### Terminal

**Note:** You may need to configure your terminal preferences to run `source ~/arch-dotfiles/.zshrc` when the application starts.*

* [Yakuake](/https://apps.kde.org/yakuake/) - Terminal emulator, `cherry` theme
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
| Type              | Program                  |
| :----------       | :-----------             |
| Browser           | Firefox, Brave           |
| Terminal          | Yakuake                  |
| Terminal Editor   | Vim                      |
| File Manager      | Dolphin                  |
| Password Manager  | KeePassXC + keepassxc-cli|
| Code Editor       | Jetbrains                |
| Music Player      | Sayonara                 |
| Pixel Art         | Aseprite                 |
| Chat              | Element, Discord, Signal |
| Cloud Storage     | pCloud                   |
| VPN Client        | NordVPN                  |
| Screenshot        | Spectacle                |
| Converter: .deb   | debtap                   |
| YT Download       | youtube-dl-git           |

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

* Use yay to install and update:

        yay -S [package-name-from-AUR]
        yay

### To Check Out Later
* [Spacemacs](https://www.spacemacs.org/doc/DOCUMENTATION.html)
