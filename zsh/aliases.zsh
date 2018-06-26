alias grep='grep --color=auto'
alias ..='cd ../'

alias l="ls -ohFG"
alias ll="ls -ohAFG"

### Per-machine settings
for file in ~/.{environment,extra}; do
  if [ -f "$file" ]; then
  	source "$file"
  fi
done
unset file

# Color output with grc
if which grc > /dev/null; then
  alias ping='grc --colour=auto ping'
  alias traceroute='grc --colour=auto traceroute'
  alias make='grc --colour=auto make'
  alias diff='grc --colour=auto diff'
fi
