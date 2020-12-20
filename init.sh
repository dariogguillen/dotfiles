#!/bin/bash

folder=`pwd`

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ln -sf $folder/zshrc ~/.zshrc

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/

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
ln -sf $folder/alacritty ~/.config/alacritty
ln -sf $folder/i3 ~/.config/i3
ln -sf $folder/dunst ~/.config/dunst
ln -sf $folder/ranger ~/.config/ranger
ln -sf $folder/nvim ~/.config/nvim
ln -sf $folder/tmuxinator ~/.config/tmuxinator
ln -sf $folder/zshrc ~/.zshrc
ln -sf $folder/tmux.conf ~/.tmux.conf
ln -sf $folder/tmux-status.conf ~/.tmux-stats.conf
ln -sf $folder/zshrc ~/.zshrc
ln -sf $folder/xprofile ~/.xprofile

mkdir ~/bin
ln -f $folder/rofi_run ~/bin/rofi_run

sudo ln -sf $folder/10-monitor.conf /usr/share/X11/xorg.conf.d/10-monitor.conf
sudo ln -sf $folder/pacman.conf /etc/pacman.conf

# neovim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install packages
yay -Syu \
accountsservice \
alacritty \
alsa-firmware \
alsa-lib \
alsa-plugins \
alsa-tools \
alsa-utils \
arandr \
autoconf \
automake \
b43-fwcutter \
bash \
betterlockscreen \
binutils \
bison \
blueman \
bluez \
bluez-cups \
bluez-plugins \
bluez-tools \
bluez-utils \
broadcom-wl \
bumblebee-status \
bzip2 \
camunda-modeler \
coreutils \
cpanminus \
cryptsetup \
ctags \
dbvis \
device-mapper \
dhclient \
dhcpcd \
diffutils \
docker \
docker-compose \
dunst \
e2fsprogs \
efibootmgr \
efitools \
etcher-bin \
ethtool \
evince \
exfat-utils \
exo \
f2fs-tools \
feh \
ffmpeg \
file \
filesystem \
findutils \
firefox \
flex \
gawk \
gcc \
gcc-libs \
gettext \
git \
glibc \
gnome-keyring \
gparted \
gpicview \
gptfdisk \
graphql-playground-electron \
grep \
gsimplecal \
gst-libav \
gst-plugins-base \
gst-plugins-good \
gstreamer \
gtk-engine-murrine \
gtk-engines \
gtk3 \
gvfs \
gvfs-afc \
gvfs-mtp \
gzip \
haveged \
hdparm \
htop \
i3-gaps \
i3status \
inetutils \
insomnia \
intel-ucode \
intellij-idea-community-edition \
iproute2 \
iputils \
ipw2100-fw \
ipw2200-fw \
jfsutils \
keybase-bin \
laptop-detect \
less \
libmad \
libmatroska \
licenses \
lm_sensors \
logrotate \
lsb-release \
lvm2 \
ly \
man-db \
man-pages \
maven \
mdadm \
memtest86+ \
mkinitcpio-nfs-utils \
nbd \
neovim-nightly \
netctl \
nfs-utils \
nilfs-utils \
nitrogen \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
ntfs-3g \
nvm \
os-prober \
p7zip \
pacman \
pacman-contrib \
pamixer \
parted \
patch \
pavucontrol \
pciutils \
pcmanfm \
perl \
perl-anyevent-i3 \
picom \
pkgconf \
playerctl \
polkit-gnome \
postgresql \
postgresql-libs \
powerline-fonts \
procps-ng \
psmisc \
pulseaudio \
pulseaudio-alsa \
pulseaudio-bluetooth \
python-pip \
python-pynvim \
python2-pynvim \
ranger \
refind \
reflector \
reiserfsprogs \
ripgrep \
rofi \
rsync \
ruby \
s-nail \
sbt \
scala \
scrot \
sdparm \
sed \
semver \
shadow \
slack-desktop \
smartmontools \
spotify \
sudo \
sysfsutils \
syslinux \
systemd-sysvcompat \
tar \
telegram-desktop-bin \
terminus-font \
texinfo \
tmux \
tmuxinator \
transmission-gtk \
ttf-anonymous-pro \
ttf-dejavu \
ttf-fira-code \
ttf-font-awesome \
ttf-hack \
tumbler \
unrar \
usbutils \
util-linux \
vi \
vim \
visual-studio-code-bin \
vlc \
volumeicon \
w3m \
wget \
which \
wireless-regdb \
wireless_tools \
wmctrl \
wpa_actiond \
wpa_supplicant \
xarchiver \
xclip \
xdg-user-dirs \
xdotool \
xf86-video-intel \
xfce4-power-manager \
xfce4-settings \
xfsprogs \
xl2tpd
