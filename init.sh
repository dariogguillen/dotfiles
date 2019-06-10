#!/bin/bash

folder=`pwd`

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $folder/zshrc ~/.zshrc

# install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout v0.33.11

# install spaceship for zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

# zsh plugins
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search

# tmux plugins manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#bumblebee status bar for i3wm
#git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git ~/.config/bumblebee-status

# eliminar folder para evitar errores
#rm -rf ~/.config/i3 ~/.config/termite ~/.config/dunst ~/.ranger ~/.config/i3status ~/.config/nvim

# config files
#ln -sf $folder/i3 ~/.config/
#ln -sf $folder/termite ~/.config/
#ln -sf $folder/dunst ~/.config/
#ln -sf $folder/ranger ~/.config/
#ln -sf $folder/i3status ~/.config/

# neovim
#ln -sf $folder/nvim ~/.config/

# neovim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# coc-json coc-tsserver coc-html coc-css coc-vetur coc-yaml coc-python coc-highlight coc-emmet coc-snippets coc-git coc-svg coc-vimlsp coc-angular coc-import-cost coc-pairs coc-jest coc-syntax coc-prettier coc-eslint coc-docker

# accountsservice
# alsa-firmware
# alsa-lib
# alsa-plugins
# alsa-tools
# alsa-utils
# arandr
# archlabs-dARK
# archlabs-icons
# archlabs-keyring
# archlabs-ksuperkey
# archlabs-networkmanager-dmenu
# archlabs-polybar
# archlabs-scripts
# archlabs-skel-base
# archlabs-skel-i3-gaps
# archlabs-themes
# archlabs-wallpapers
# autoconf
# automake
# awesome-terminal-fonts
# b43-firmware
# b43-fwcutter
# bash
# bbswitch
# binutils
# bison
# blueman
# bluez-cups
# bluez-firmware
# bluez-plugins
# bluez-tools
# bluez-utils
# broadcom-wl
# bumblebee
# bzip2
# chromium
# clonezilla
# cmake
# compton
# coreutils
# cryptsetup
# ctags
# device-mapper
# dhclient
# dhcpcd
# diffutils
# docker
# docker-compose
# dunst
# e2fsprogs
# efibootmgr
# efitools
# ethtool
# evince
# exfat-utils
# exo
# f2fs-tools
# feh
# ffmpeg
# file
# filesystem
# findutils
# firefox
# flex
# galculator
# gawk
# gcc
# gcc-libs
# gettext
# git
# gled-git
# glibc
# gnome-keyring
# google-chrome
# gparted
# gpicview
# gptfdisk
# graphql-playground-electron
# grep
# gsimplecal
# gst-libav
# gst-plugins-base
# gst-plugins-good
# gstreamer
# gtk-engine-murrine
# gtk-engines
# gtk3
# gvfs
# gzip
# haveged
# hdparm
# htop
# i3-gaps
# i3status
# inetutils
# intel-ucode
# iproute2
# iputils
# ipw2100-fw
# ipw2200-fw
# jfsutils
# klavaro
# laptop-detect
# less
# libmad
# libmatroska
# licenses
# light-locker
# lightdm
# lightdm-gtk-greeter
# lightdm-gtk-greeter-settings
# linux
# linux-firmware
# linux-headers
# lm_sensors
# logrotate
# lsb-release
# lvm2
# m4
# make
# man-db
# man-pages
# mdadm
# memtest86+
# mesa-demos
# mkinitcpio-nfs-utils
# nbd
# neofetch
# neovim-nightly
# netctl
# networkmanager
# nfs-utils
# nilfs-utils
# nitrogen
# noto-fonts
# noto-fonts-emoji
# noto-fonts-extra
# ntfs-3g
# nvidia
# openvpn
# otf-fira-code
# otf-fira-mono
# otf-fira-sans
# otf-font-awesome
# p7zip
# pacman
# pacman-contrib
# pamixer
# parted
# patch
# pavucontrol
# pciutils
# pcmanfm
# perl
# perl-anyevent-i3
# pkgconf
# playerctl
# polkit-gnome
# primus
# procps-ng
# psmisc
# pulseaudio
# pulseaudio-alsa
# pulseaudio-bluetooth
# python-neovim
# python-pip
# python2-neovim-git
# python2-pip
# qt5-styleplugins
# qt5ct
# ranger
# reflector
# reiserfsprogs
# ripgrep
# rofi
# rsync
# ruby
# ruby-neovim
# rust
# s-nail
# scrot
# sdparm
# sed
# shadow
# slack-desktop
# smartmontools
# spotify-stable
# steam
# sudo
# sysfsutils
# syslinux
# systemd-sysvcompat
# tar
# telegram-desktop
# terminus-font
# termite
# texinfo
# the_silver_searcher
# tmux
# transmission-gtk
# ttf-anonymous-pro
# ttf-dejavu
# ttf-fira-code
# ttf-font-awesome
# ttf-hack
# ttf-mononoki
# ttf-ubuntu-font-family
# tumbler
# unrar
# unzip
# usbutils
# util-linux
# vi
# vim
# visual-studio-code-bin
# vlc
# volumeicon
# vulkan-extra-layers
# vulkan-headers
# vulkan-intel
# vulkan-validation-layers
# w3m
# wget
# which
# wireless-regdb
# wireless_tools
# wmctrl
# wpa_actiond
# wpa_supplicant
# xarchiver
# xboxdrv
# xclip
# xdg-user-dirs
# xdotool
# xf86-input-evdev
# xf86-input-keyboard
# xf86-input-libinput
# xf86-input-mouse
# xf86-input-synaptics
# xf86-input-vmmouse
# xf86-input-void
# xf86-video-amdgpu
# xf86-video-ati
# xf86-video-dummy
# xf86-video-fbdev
# xf86-video-intel
# xf86-video-openchrome
# xf86-video-qxl
# xf86-video-vesa
# xf86-video-vmware
# xf86-video-voodoo
# xfce4-power-manager
# xfce4-settings
# xfsprogs
# xkeycaps
# xl2tpd
# xorg-docs
# xorg-fonts-100dpi
# xorg-fonts-75dpi
# xorg-iceauth
# xorg-luit
# xorg-server
# xorg-server-common
# xorg-server-devel
# xorg-server-xdmx
# xorg-server-xephyr
# xorg-server-xnest
# xorg-server-xvfb
# xorg-server-xwayland
# xorg-sessreg
# xorg-setxkbmap
# xorg-smproxy
# xorg-x11perf
# xorg-xauth
# xorg-xbacklight
# xorg-xcmsdb
# xorg-xcursorgen
# xorg-xdpyinfo
# xorg-xdriinfo
# xorg-xev
# xorg-xgamma
# xorg-xhost
# xorg-xinput
# xorg-xkbcomp
# xorg-xkbevd
# xorg-xkbutils
# xorg-xkill
# xorg-xlsatoms
# xorg-xlsclients
# xorg-xmodmap
# xorg-xpr
# xorg-xprop
# xorg-xrandr
# xorg-xrdb
# xorg-xrefresh
# xorg-xset
# xorg-xsetroot
# xorg-xvinfo
# xorg-xwd
# xorg-xwininfo
# xorg-xwud
# yay
# zip
# zsh
# zsh-completions
# zsh-history-substring-search
