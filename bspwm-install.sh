#!/bin/bash

# Easy setup for testing
mkdir -p ~/.local/share/fonts
cp IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
mkdir ~/Pictures
cp wallpapers/* ~/Pictures
cp -R .config/* ~/.config/
cp -R .screenlayout ~/
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
chmod -R +x ~/.screenlayout
packages=`grep -vE "^#" arch-packages.txt` 
sudo pacman -Syu --needed --noconfirm $packages
sudo systemctl enable NetworkManager.service
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf

