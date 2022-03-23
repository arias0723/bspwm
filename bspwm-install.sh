#!/bin/bash

# Init
CURRENT_USER=$(cat /etc/passwd | grep "/home" |cut -d: -f1 |head -1)
INSTALL_PACKAGES=`grep -vE "^#" arch-packages.txt`
mkdir -p ~/.config
mkdir -p ~/.local/share/fonts
mkdir ~/Pictures

# Install base packages
sudo pacman -Syu --needed --noconfirm $INSTALL_PACKAGES
yay -S --nodiffmenu --noremovemake --answerclean All --noconfirm picom-ibhagwan-git polybar

# WM cfg
cp -R .config/. ~/.config/
cp -R resources/.screenlayout ~/
cp -R resources/.Xresources.d ~/
cp -R resources/wallpapers/. ~/Pictures
cp -R resources/fonts/. ~/.local/share/fonts
cp resources/.Xresources ~/
cp resources/.xinitrc ~/
cp resources/.gtkrc-2.0 ~/
cp resources/.tmux.conf ~/
cp resources/.tmux.conf.local ~/
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
chmod -R +x ~/.screenlayout
chmod +x ~/.xinitrc

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

