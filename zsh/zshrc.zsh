export TERM='xterm-256color'
export EDITOR="nvim"

# set prompt
preexec() { PREEXEC_CALLED=1 }
precmd() {
    RETURN_CODE=$?
    if [[ -v VIRTUAL_ENV ]] || [[ -v CONDA_DEFAULT_ENV ]]; then
        if [[ -v CONDA_DEFAULT_ENV ]]; then VIRTUAL_ENV_PROMPT=${CONDA_DEFAULT_ENV}
        else VIRTUAL_ENV_PROMPT=${${VIRTUAL_ENV%/*}##*/}; fi
        LHS="%F{25}<${VIRTUAL_ENV_PROMPT}>%f%U%(3~|.../%1~|%~)%u"
    else
        LHS="%B%F{25}|%f%b%U%(4~|.../%2~|%~)%u"
    fi
    if [[ "$RETURN_CODE" != 0 ]] && [[ "$PREEXEC_CALLED" = 1 ]]
    then PROMPT="%B%F{88}[%F{202}%S%m%s%f%b${LHS}%B%F{88}]%f%b "
    else PROMPT="%B%F{34}[%F{245}%S%m%s%f%b${LHS}%B%F{34}]%f%b "
    fi
    PREEXEC_CALLED=0
}

# setup dir stack
DIRSTACKSIZE=9
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups

# history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt BANG_HIST

setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

setopt HIST_VERIFY


ANTIGEN="$HOME/.local/share/antigen.zsh"
if [ ! -f $ANTIGEN ]; then
	echo 'Installing antigen ...'
    curl --fail --location --output $ANTIGEN --create-dirs http://git.io/antigen
fi
source $ANTIGEN

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:utility:grep' color 'no'
zstyle ':prezto:module:syntax-highlighting' highlighters \
        'main' \
        'brackets' \
        'pattern' \
        'regexp'

zstyle ':prezto:load' pmodule \
        'environment' \
        'utility' \
        'completion' \
        'history-substring-search' \
        'autosuggestions' \
        'syntax-highlighting'

antigen use prezto
antigen bundle rupa/z z.sh
antigen apply

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


zle_highlight+=('paste:none')

rcs=(
    hikari.zsh
    aliases.zsh
    system.zsh
    local.zsh
)
for rc (~/.config/zsh/$^rcs); do
    if [ -f $rc ]; then source $rc; fi
done
unset rcs
