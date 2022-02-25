#!/bin/bash

# Easy setup for testing
mkdir ~/.local/share/fonts
cp -R IosevkaTermNerdFontComplete.ttf ~/.local/share/fonts
mkdir ~/Pictures
cp wallpapers/* ~/Pictures
cp -R .config/* ~/.config/
chmod -R +x ~/.config/bspwm
chmod -R +x ~/.config/polybar/scripts
grep -vE "^#" arch-packages.txt | sudo pacman -Syu --needed --noconfirm
sudo fc-cache -f -v
dbus-launch dconf load / < xed.dconf

