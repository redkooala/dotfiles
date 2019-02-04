# Path to your oh-my-zsh installation.
  export ZSH="/home/orangesan/.oh-my-zsh"

ZSH_THEME="robbyrussell"

### set plugins
plugins=(git)

## user settings
source $ZSH/oh-my-zsh.sh
export TERM='xterm-256color'
echo -ne '\e]12;#ff0000\a'
gsettings set org.gnome.desktop.interface cursor-blink false

