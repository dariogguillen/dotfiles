# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/dariogg/.local/bin:$PATH
export EDITOR=nvim
export HISTCONTROL=ignoreboth

# systemd-logind never starts a session for the WSL user here, so
# /run/user/<uid> (what $XDG_RUNTIME_DIR points at) is never created.
# Fall back to a writable dir apps can actually use for sockets.
if [ -n "$WSL_DISTRO_NAME" ] && [ ! -d "/run/user/$(id -u)" ]; then
    export XDG_RUNTIME_DIR="/tmp/xdg-runtime-$(id -u)"
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

# WSLg's Wayland socket lives outside $XDG_RUNTIME_DIR for the same reason.
# Point at the real socket directly (Wayland supports absolute paths).
if [ -n "$WSL_DISTRO_NAME" ] && [ -S /mnt/wslg/runtime-dir/wayland-0 ]; then
    export WAYLAND_DISPLAY=/mnt/wslg/runtime-dir/wayland-0
fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    nvm
    dotenv
    safe-paste
    zsh-completions
    sudo
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
command -v pokemon-colorscripts >/dev/null && pokemon-colorscripts --no-title -r 1

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/folders in terminal
alias update="yay -Syu --devel"
alias txn="tmuxinator new"
alias txs="tmuxinator start"
alias n=nvim
alias c=claude

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
command -v fzf >/dev/null && source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

command -v ruby >/dev/null && PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# spaceship configuration
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_DIR_TRUNC=1
SPACESHIP_HOST_SHOW=false

# Kubectl
command -v kubectl >/dev/null && source <(kubectl completion zsh)

# Kubectx
autoload -U compinit && compinit

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

command -v direnv >/dev/null && eval "$(direnv hook zsh)"

export PATH="$PATH:/home/dariogg/.local/share/coursier/bin"


autoload -U compinit
[[ -d $HOME/.bloop/zsh ]] && fpath=($HOME/.bloop/zsh $fpath)
compinit

export IDEA_JDK=/usr/lib/jvm/jre-jetbrains


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
