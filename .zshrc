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

###alices
alias front_test='make restart && make test without_debug=1 with_assets_build=0 with_apidoc_build=0 test_frontend_suite=1 fail_exit=1'

alias php_server='php ~/.config/composer/vendor/bin/php-language-server.php --tcp-server=127.0.0.1:4001'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
