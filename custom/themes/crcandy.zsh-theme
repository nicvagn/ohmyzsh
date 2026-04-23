PROMPT=$'%{$fg_bold[red]%}%n@%m%{$reset_color%}%{$fg[white]%}%~%{$reset_color%} $(git_prompt_info)\
%{$fg[red]%}>%{$reset_color%}'
RPROMPT="%t"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
