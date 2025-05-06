#!/bin/bash

folder=$(pwd)

#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

yay -S luarocks rustup composer julia python-pip rust-analyzer # telegram-desktop picom powerline-fonts awesome-terminal-fonts powerline-fonts-git powerline-i3-git ttf-devicons ttf-material-design-icons-git ttf-material-design-icons-desktop-git ttf-material-design-icons-extended ttf-material-design-icons-webfont ttf-material-design-iconic-font ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono unicode-emoji unicode-character-database ttf-fira-code xclip tmux python-pynvim spotify-launcher chromium jdk21-openjdk jdk17-openjdk jdk11-openjdk java-runtime-common lazygit lazydocker vim nvim nvidia nvidia-lts nvidia-utils nvidia-prime nvidia-settings virtualgl lib32-virtualgl vulkan-tools vulkan-intel vulkan-html-docs vulkan-extra-tools vulkan-utility-libraries vulkan-validation-layers vulkan-mesa-layers vulkan-extra-layers lib32-vulkan-validation-layers lib32-vulkan-icd-loader lib32-vulkan-mesa-layers intel-ucode xf86-video-intel mesa mesa-demos mesa-utils lib32-mesa-demos lib32-vulkan-mesa-layers lib32-mesa-utils lib32-mesa eza alacritty wezterm brave-bin docker docker-compose zsh scala sbt fzf ruby kubectl kubectx tmuxinator pokemon-colorscripts

#archlinux-java set java-17-openjdk

#sudo usermod -aG docker $USER
#newgrp docker
#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install spaceship for zsh
#git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
#ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

# zsh plugins
#git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
#git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search

# tmux plugins manager
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# eliminar folder para evitar errores

# config files
ln -sf $folder/alacritty ~/.config/alacritty
ln -sf $folder/i3 ~/.config/i3
# ln -sf $folder/dunst ~/.config/dunst
#ln -sf $folder/ranger ~/.config/ranger
ln -sf $folder/lazyvim ~/.config/nvim
ln -sf $folder/tmuxinator ~/.config/tmuxinator
ln -sf $folder/zshrc ~/.zshrc
ln -sf $folder/tmux.conf ~/.tmux.conf
ln -sf $folder/tmux-status.conf ~/.tmux-status.conf
ln -sf $folder/wezterm.lua ~/.wezterm.lua
ln -sf $folder/wezterm-nordfox.toml ~/.wezterm-nordfox.toml
#ln -sf $folder/xprofile ~/.xprofile

ln -sf /media/data/Documents ~/Documents
ln -sf /media/data/Downloads ~/Downloads
ln -sf /media/data/Music ~/Music
ln -sf /media/data/Pictures ~/Pictures
ln -sf /media/data/Public ~/Public
ln -sf /media/data/Templates ~/Templates
ln -sf /media/data/Videos ~/Videos

# sudo ln -sf $folder/10-monitor.conf /usr/share/X11/xorg.conf.d/10-monitor.conf
# sudo ln -sf $folder/pacman.conf /etc/pacman.conf

#chsh -s /bin/zsh

#source ~/.zshrc

#nvm install --lts
#nvm use --lts
#nvm install-latest-npm

#npm i -g neovim typescript tree-sitter

git config --global user.name "Darío Guillén"
git config --global user.email guillendario@gmail.com
git config --global core.editor vim
