#!/usr/bin/env bash

sudo pacman -S yaourt && yaourt --noconfirm -S \
redshift \                # application launched at login
megasync \                # application launched at login
firefox-developer \       # application launched at login
rambox-bin \              # application launched at login
spotify \                 # application launched at login
zsh \                     # alternative shell
gvim \                    # text editor
rxvt-unicode \            # terminal emulator
ttf-font-awesome \        # font used in i3 bar
i3 \                      # tiling window manager
i3blocks \                # replacement for i3bar
rofi \                    # application launcher
pactl \                   # pulse audio controller
feh \                     # background manager for X
arandr \                  # graphical tool for multi-monitors (xrandr)
compton \                 # standalone compositor
dunst \                   # minimal notification daemon
lxappearance \            # graphical tool for GTK visuals tweak
network-manager \         # network manager
network-manager-applet \  # network manager applet
acpi \                    # used in battery-indicator.py script
playerctl \               # used in spotify-currently-playing.py script
xbacklight \              # used in backlight-indicator.py script

# install yadm
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm

# make executable
sudo chmod a+x /usr/local/bin/yadm

# clone dotfile repo, tries to merge with
yadm clone https://github.com/lancelafontaine/dotfiles.git
