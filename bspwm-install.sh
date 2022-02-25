#!/bin/bash

# Easy setup for testing
mkdir -p ~/.local/share/fonts
cp IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
mkdir ~/Pictures
cp wallpapers/* ~/Pictures
cp -R .config/* ~/.config/
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
packages=`grep -vE "^#" arch-packages.txt` 
sudo pacman -Syu --needed --noconfirm $packages
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf

