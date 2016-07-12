## Invoke the global bash completion
source /usr/share/bash-completion/bash_completion

## Include autocompletion for Amazon API commands
complete -C aws_completer aws

## Include rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

