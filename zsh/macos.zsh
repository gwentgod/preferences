eval "$(/opt/homebrew/bin/brew shellenv)"

alias disp='socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"'

alias paste='pbpaste'
alias copy='pbcopy'

function code() {
    if [[ $# = 0 ]]
    then
        open -a 'Visual Studio Code'
    else
        F=`readlink -f $1`
        open -a 'Visual Studio Code' --args "$F"
    fi
}

function tower() {
    if [[ $# = 0 ]]
    then
        open -a 'Tower'
    else
        F=`readlink -f $1`
        open -a 'Tower' --args "$F"
    fi
}

function prl() {
	open -a 'Parallels Desktop'
	sleep 2
	prlctl start ${1:-'win11'}
}

function burn() {
    echo "dd bs=4m if=$1 of=$2 conv=fsync oflag=direct status=progress"
}
