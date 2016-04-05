## Here you can define your default options for commands, or even
# create your own commands using bash aliases
SYSTEM=$(uname -s)

## Grep related aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias igrep='grep --color=auto -i'

## LS aliases
alias l='ls -alF --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'

## Open command like in Mac OS X
# and a reload to re-read the config rc files
alias open='xdg-open'
alias reload="source ~/.bashrc"

## Safe move and copy commands
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

## Git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%an %cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gd='git diff'
alias gaa='git add --all'
alias gcmv='git commit'
alias gcmi='git commit -m'
alias gpl='git pull --rebase'
alias gpm='git push origin master'
alias gps='git push origin'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gpc='git push origin $(git branch | head -n 1 | cut -d " " -f 2-)'

## Cat with color and syntax highlight
alias ccat='pygmentize -O style=monokai -f console256 -g'
alias dog='ccat'

## Vim ignoring global config
alias vim="vim -u ~/.vimrc"

## Better Docker management
alias docker-rma='docker rm -f $(docker ps -aq)' 
alias docker-ip="docker inspect --format '{{ .NetworkSettings.IPAddress  }}'"

## Emacs aliases
alias em='emacs -nw'
alias emacs="emacsclient -c -a emacs"
alias rcemacs="systemctl --user restart emacsd.service"

