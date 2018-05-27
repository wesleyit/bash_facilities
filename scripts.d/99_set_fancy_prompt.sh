## Red for root, green for others
[ "$UID" -eq "0" ] &&
ps_user="\[\033[01;31m\]\u@\h" || 
ps_user="\[\033[01;32m\]\u@\h"

## Blue short path
ps_path="\[\033[01;34m\]\w"

## Show # for root or $ for users
ps_priv="\[\033[35m\]\\$"

## Get back to shell default color
ps_reset="\[\033[00m\]"

## Set git options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1

function ps_venv() {
[[ -z "$VIRTUAL_ENV" ]] && echo "$1" || echo '(V)'
}

#export PS1="[$ps_user: $ps_path$ps_reset\$(__git_ps1 \" git:(%s)\")]$ps_priv $ps_reset"
PROMPT_COMMAND='__git_ps1 "[$ps_user: $ps_path$ps_reset" "]$(ps_venv $ps_priv) $ps_reset"'

