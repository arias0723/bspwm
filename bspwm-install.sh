#!/bin/bash

# Easy setup for testing
mkdir -p ~/.config
mkdir -p ~/.local/share/fonts
mkdir ~/Pictures

cp IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
cp wallpapers/* ~/Pictures
cp .xinitrc ~/
cp -R .config/* ~/.config/
cp -R .screenlayout ~/
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
chmod -R +x ~/.screenlayout

packages=`grep -vE "^#" arch-packages.txt` 
sudo pacman -Syu --needed --noconfirm $packages
sudo yay -S --nodiffmenu --noremovemake --answerclean All --noconfirm picom-ibhagwan-git

sudo systemctl enable NetworkManager.service
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf

