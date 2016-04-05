#!/bin/bash
## This script runs during the start of an interactive session, 
# for example when you open a new session in the terminal.
# It checks the time and if the seconds are even, 
# displays a message fortune told by the cow.
# If they are odd, it displays a drawing made in asciiart.
# You can change the fortunes in the $FORTUNE_DIR if you dont like them.

FORTUNE_DIR="$BFDIR/fortunes"
FORTUNE_COOKIE="$(( `date +%s` % 2  ))"
if [ $FORTUNE_COOKIE -eq 0 ]
then
        fortune "$FORTUNE_DIR" | cowsay -W 80
else
        fortune "$FORTUNE_DIR/off"
fi
echo -ne "\n" 

