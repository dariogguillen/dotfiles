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
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -sf "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# zsh plugins
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search

#bumblebee status bar for i3wm
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git ~/.config/bumblebee-status

# config files
ln -sf $folder/i3 ~/.config/
ln -sf $folder/termite ~/.config/
ln -sf $folder/dunst ~/.config/
ln -sf $folder/ranger ~/.config/
ln -sf $folder/i3status ~/.config/

# vimrc
ln -sf $folder/vimrc ~/.vimrc

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
