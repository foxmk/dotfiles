autoload -Uz vcs_info
autoload -U colors && colors

function precmd() {
  vcs_info
}

local flags_fmt="%F{red}%u%f%F{green}%c%f"

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:git:*' formats " %F{green}%b%f ${flags_fmt}"
zstyle ':vcs_info:git:*' actionformats " %F{green}%b%f% ${flags_fmt} (%a)"

local cwd="%F{cyan}%~%f"
local priv_lvl=" %(!.#.$)"

setopt prompt_subst
PROMPT="${cwd}\${vcs_info_msg_0_}${priv_lvl} "
