
function git_char {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[cyan]%}→%{$reset_color%}" && return
  echo '-'
}
# Will not work if called after parse_git
function passed(){
    if [[ $? == 0 ]]; then
	echo "[%{$fg[green]%}✓%{$reset_color%}]"
    else
	echo "[%{$fg[red]%}✗%{$reset_color%}]"
    fi
}

function layout_char {
local layout=$(xset -q | sed -nE 's/(.*Scroll Lock:\s+)(on|off)/\2/p') 2>/dev/null
if [[ $layout == on  ]]; then
    echo '⊥'
else
    echo '⋯'
fi
}
#⁅⁆

function parse_git_info {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "[$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX]"
}
PROMPT='⎣%{$fg[blue]%}%n%{$reset_color%}@%m %{$fg_bold[grey]%}%2c%{$reset_color%}%{$fg[white]%}⎦ '
RPROMPT='$(parse_git_info)%(?.[%{$fg[green]%}✓%{$reset_color%}].[%{$fg[red]%}✗%{$reset_color%}])'
ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
