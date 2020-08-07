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
    
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        
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

## Other Useful Notes

### Git: Generating SSH Keys
* After following [Github's guide](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), copy the key from the `.id_rsa.pub` file.


### Aliases
* Obviously, some of the aliases in my `.bash_aliases` file will not be useful to you. Delete and keep what you'd like -- make it your own :)

### Themes
* If you ever want to modify an existing theme, add the modified file (different name than the original) to the `.zsh-custom/themes` folder. Then source that `.zsh-theme` file in .zshrc to apply the theme.

### Terminal

***Note:** You may need to configure your terminal preferences to run `source ~/arch-dotfiles/.zshrc` when the application starts.*

* [Tilda](https://github.com/lanoxx/tilda/) - Terminal emulator, such as Konsole
* [Colour palette ideas](https://github.com/lysyi3m/macos-terminal-themes)

![*Japanesque* colour palette](https://raw.githubusercontent.com/lysyi3m/macos-terminal-themes/master/screenshots/japanesque.png)

### Privacy & Security
* [Restore Privacy](https://restoreprivacy.com/)
* [Firefox privacy modification guide](https://restoreprivacy.com/firefox-privacy/)

### Preferred Software
| Type              | Program            |
| :----------       | :-----------       |
| Browser           | Firefox, Brave     |
| Terminal          | Tilda              |
| Terminal Editor   | Vim                |
| File Manager      | Dolphin            |
| Password Manager  | KeePassXC          |
| Code Editor       | VS Code, Jetbrains |
| Music Player      | Sayonara           |
| Pixel Art         | Aseprite           |
| Chat              | Element (Riot)     |
| Cloud Storage     | pCloud             |
| VPN Client        | ProtonVPN          |
| Screenshot        | Shutter, Lookit    |
| YT Download       | youtube-dl-git     |

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
