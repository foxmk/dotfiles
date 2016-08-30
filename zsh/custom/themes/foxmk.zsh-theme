function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

# Example prompt:
# ~/development git:master venv:env % command...
PROMPT='
%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info)$(virtualenv_prompt_info)
%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" git:%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
# ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="-"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="+"
# ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX=":%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX=" venv:%{$fg[green]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"
