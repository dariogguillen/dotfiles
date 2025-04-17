#!/bin/bash

folder=$(pwd)

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ln -sf $folder/zshrc ~/.zshrc

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

# eliminar folder para evitar errores

# config files
# ln -sf $folder/alacritty ~/.config/alacritty
#ln -sf $folder/i3 ~/.config/i3
# ln -sf $folder/dunst ~/.config/dunst
#ln -sf $folder/ranger ~/.config/ranger
# ln -sf $folder/nvim ~/.config/nvim
ln -sf $folder/tmuxinator ~/.config/tmuxinator
# ln -sf $folder/zshrc ~/.zshrc
ln -sf $folder/tmux.conf ~/.tmux.conf
ln -sf $folder/tmux-status.conf ~/.tmux-stats.conf
#ln -sf $folder/xprofile ~/.xprofile

#mkdir ~/bin
#ln -f $folder/rofi_run ~/bin/rofi_run

# sudo ln -sf $folder/10-monitor.conf /usr/share/X11/xorg.conf.d/10-monitor.conf
# sudo ln -sf $folder/pacman.conf /etc/pacman.conf

# neovim plug
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
