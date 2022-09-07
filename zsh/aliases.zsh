alias grep="${aliases[grep]:-grep} --color=auto"
alias tree='tree -F --dirsfirst --filelimit=10'

alias vim='nvim'

function utg() { tar -xzvf ${1}; rm $1 }

function tg() {
    if [ -f "../${PWD##*/}.tar.gz" ]; then
        echo "../${PWD##*/}.tar.gz" exists. Abord.
    else
        tar -czvf "../${PWD##*/}.tar.gz" "../${PWD##*/}"
        ${aliases[open]:-open} ..
    fi
}

function zipdir() {
    zip -x '*.DS_Store' -x '._*' -r $1.zip $1
}


alias myip='dig +short txt ch whoami.cloudflare @1.0.0.1'

alias wclone='wget --mirror --convert-links --adjust-extension --page-requisites --no-parent'

alias aria2="open ~/.local/share/aria2/index.html && aria2c"
