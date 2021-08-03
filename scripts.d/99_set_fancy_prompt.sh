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
ESC='\e['
END='\e[m'
RST='\e[0;0m'
RED='01;31m'
GREEN='01;32m'
YELLOW='01;33m'
BLUE='01;34m'


## Set git options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ "$UID" -eq "0" ]; then
    COLOR='01;31m'
    SYM="$ROOT_SYM"
else
    COLOR='01;32m'
    SYM="$USER_SYM"
fi

ps_user="\[${ESC}${COLOR}\]\u\[${END}\]"
ps_sym="\[${ESC}${COLOR}\]${SYM}\[${END}\]"
ps_host="\[${ESC}${COLOR}\]\h\[${END}\]"
ps_path="\[${ESC}${BLUE}\]\w\[${END}\]"
ps_priv="\[${ESC}${COLOR}\]\$\[${END}\]"

function ps_venv() {
    local COLOR='01;33m'
    [[ -z "$VIRTUAL_ENV" ]] || 
        echo -ne "──[${ESC}${COLOR}${VENV_SYM} virtualenv${END}]"
}

function ps_aws() {
    local COLOR='01;33m'
    if env | egrep -q 'AWS_PROFILE|AWS_ACCESS_KEY_ID'; then
        echo -ne "──[${ESC}${COLOR}${AWS_SYM} aws${END}]"
    fi
}

function ps_git() {
    local COLOR='01;35m'
    if git status &> /dev/null; then

        echo -ne "──[${ESC}${COLOR}${GIT_SYM} git$(__git_ps1)${END}]"
    fi
}

export PS1="
╭──[$ps_user $ps_sym $ps_host]──[$ps_path]\$(ps_venv)\$(ps_aws)\$(ps_git)
│
╰──$ps_priv "
