alias grep='grep --color=auto'
alias ..='cd ../'

alias l="ls -ohFG"
alias ll="ls -ohAFG"

# Color output with grc
if which grc > /dev/null; then
  alias ping='grc --colour=auto ping'
  alias traceroute='grc --colour=auto traceroute'
  alias make='grc --colour=auto make'
  alias diff='grc --colour=auto diff'
fi
