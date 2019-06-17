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
