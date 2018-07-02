# History settings

if [ -z $HISTFILE ]; then
    export HISTFILE=$HOME/.zsh_history
fi

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export HISTCONTROL=ignoredups

setopt append_history
setopt extended_history

setopt hist_reduce_blanks
setopt hist_ignore_space

setopt hist_verify
setopt inc_append_history
