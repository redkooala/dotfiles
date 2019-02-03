#CORE
export ZSH="/home/orangesan/.oh-my-zsh"

#THEME
ZSH_THEME="bureau"

##PLUGINS
#plugins=(git)

##SOURCE
source $ZSH/oh-my-zsh.sh

#### USER SETTINGS ####
export TERM='xterm-256color'
echo -ne '\e]12;#ff0000\a'
gsettings set org.gnome.desktop.interface cursor-blink false
