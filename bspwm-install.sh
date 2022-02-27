#!/bin/bash

# Init
CURRENT_USER=$(cat /etc/passwd | grep "/home" |cut -d: -f1 |head -1)
INSTALL_PACKAGES=`grep -vE "^#" arch-packages.txt`
mkdir -p ~/.config
mkdir -p ~/.local/share/fonts
mkdir ~/Pictures

# Install base packages
sudo pacman -Syu --needed --noconfirm $INSTALL_PACKAGES
# yay -S --nodiffmenu --noremovemake --answerclean All --noconfirm picom-ibhagwan-git

# WM cfg
cp -R .config/. ~/.config/
cp -R .screenlayout ~/
cp -R wallpapers/. ~/Pictures
cp .xinitrc ~/
cp .gtkrc-2.0 ~/
cp IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
chmod -R +x ~/.screenlayout

# ZSH cfg
cp -R resources/zsh/theme/. ~/
sudo cp -R resources/zsh/theme/. /root
sudo cp -R resources/zsh/plugins/. ~/ /usr/share
sudo ln -s -f ~/.zshrc /root/.zshrc
sudo usermod --shell /usr/bin/zsh ghost
sudo usermod --shell /usr/bin/zsh root

# Misc
sudo systemctl enable NetworkManager.service
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf

