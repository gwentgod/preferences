export PATH=$PATH:${HOME}/.local/bin

alias ls="${aliases[ls]:-ls} -X"

alias open=xdg-open

# alias paste='wl-paste'
# alias copy='wl-copy'
alias copy='xclip -selection c'
alias paste='xclip -selection c -o'

alias webstorm='/home/miyu/.local/share/WebStorm/bin/webstorm.sh'
alias pycharm='/home/miyu/.local/share/Pycharm/bin/pycharm.sh'

function burn() {
    echo "dd bs=4M if=$1 of=$2 conv=fsync oflag=direct status=progress"
}
