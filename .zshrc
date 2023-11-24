eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias awsp="source _awsp"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/a.artemyev/Development/dh-vp-auth-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/a.artemyev/Development/dh-vp-auth-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/a.artemyev/Development/dh-vp-auth-service/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/a.artemyev/Development/dh-vp-auth-service/node_modules/tabtab/.completions/sls.zsh