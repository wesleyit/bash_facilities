## Here you can define your default options for commands, or even
# create your own commands using bash aliases

## LS with colors
alias ls='ls -G'

## Reload config
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
