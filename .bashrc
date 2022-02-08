#!/bin/bash

## Hello, this is your .bashrc. 
# It is a symbolic link to the file inside your BFDIR.
# And if you make changes to this file, is a good 
# practice to save the folder using Dropbox.


## Only import this file when running an
# interactive session, otherwise, exit
[[ $- == *i* ]] || return

## Set the Bash Facilities directory, where all
# files to be included must be in.
export BFDIR="$HOME/.bash_facilities"

## Import Bash Aliases
source "$BFDIR/01_aliases.sh"

## Import Bash Functions
source "$BFDIR/02_functions.sh"

## Import Bash Environment Variables
source "$BFDIR/03_variables.sh"

## Import Configurations
source "$BFDIR/04_configs.sh"

## Import misc scripts
for file in $BFDIR/scripts.d/*.sh
do
  source "$file"
done

## If you want to include some quick config outside the 
# structure, use the local file (not included to GIT)
[ -e "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

## Here the default BF config ends ---
