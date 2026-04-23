ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red} ⓜ %f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan} ⓤ %f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green} ⩶ %f"

function _git_untracked() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
            echo "$ZSH_THEME_GIT_PROMPT_UNTRACKED"
        fi
    fi
}
function _update_prompt_vars() {
    if [[ -n $VIRTUAL_ENV ]]; then
        _PROMPT_VENV="%F{green}(${VIRTUAL_ENV:t})%f "
    else
        _PROMPT_VENV=""
    fi
    if [[ -n $CONTAINER_ID ]]; then
        _PROMPT_CONTAINER="%F{220}[${CONTAINER_ID}]%f"
    else
        _PROMPT_CONTAINER=""
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_prompt_vars

PROMPT='%{$fg_bold[red]%}%n@%m%{$reset_color%}%{$fg[white]%}:%~%{$reset_color%} $(git_prompt_info)$(_git_untracked)
%{$fg[red]%}>%{$reset_color%} '
RPROMPT='${_PROMPT_VENV}${_PROMPT_CONTAINER}'

#  LocalWords:  fg
