# Ensure you are evaluating PS1 var instead a command for prompt
unset PROMPT_COMMAND

# Change these symbols for the ones available on the font
# you are using in your terminal. This ones works in Agave Nerd Font.
USER_SYM=' '
ROOT_SYM=' '
GIT_SYM=''
VENV_SYM=''
AWS_SYM=''

# Don't change after this point
DEF="$(tput sgr0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
PURPLE="$(tput setaf 5)"
CYAN="$(tput setaf 6)"

## Set git options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ "$UID" -eq "0" ]; then
    COLOR="${RED}"
    SYM="$ROOT_SYM"
else
    COLOR="${GREEN}"
    SYM="$USER_SYM"
fi

ps_user="\[${COLOR}\]\u\[${DEF}\]"
ps_sym="\[${COLOR}\]${SYM}\[${DEF}\]"
ps_host="\[${COLOR}\]\h\[${DEF}\]"
ps_path="\[${BLUE}\]\w\[${DEF}\]"
ps_priv="\[${COLOR}\]\$\[${DEF}\]"

function ps_venv() {
    local COLOR="${CYAN}"
    [[ -z "$VIRTUAL_ENV" ]] || 
        echo -ne "──[${COLOR}${VENV_SYM} virtualenv${DEF}]"
}

function ps_aws() {
    local COLOR="${YELLOW}"
    if env | egrep -q 'AWS_PROFILE|AWS_ACCESS_KEY_ID'; then
        echo -ne "──[${COLOR}${AWS_SYM} aws${DEF}]"
    fi
}

function ps_git() {
    local COLOR="${PURPLE}"
    if git status &> /dev/null; then
        echo -ne "──[${COLOR}${GIT_SYM} git$(__git_ps1)${DEF}]"
    fi
}

export PS1="
╭──[$ps_user $ps_sym $ps_host]──[$ps_path]\$(ps_venv)\$(ps_aws)\$(ps_git)
│
╰──$ps_priv "
