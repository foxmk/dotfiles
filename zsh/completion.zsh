autoload -U compinit && compinit

setopt complete_aliases

zstyle ':completion:*' menu select
zstyle ':completion:*:hosts' hosts $hosts
