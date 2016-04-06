## Invoke the global bash completion
source /etc/bash_completion

## Include autocompletion for Amazon API commands
complete -C aws_completer aws

## Include rbenv
eval "$(rbenv init -)"

