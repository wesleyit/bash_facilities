#!/bin/bash
# ##########################################################
# shell_colors.sh
# This script will export functions used to print colorful
# messages in shell scripts or terminal commands.
# Wesley Rodrigues da Silva <wesley.it at gmail.com>
# LICENCE CREATIVE COMMONS BY - 2014
# http://creativecommons.org/licenses/by/2.0/legalcode
# ##########################################################
 
# Colors definitions (we will start with 4 colors)
RESET=0
TXT_RED=31
TXT_BLUE=34
TXT_GREEN=32
TXT_YELLOW=33

ESCAPE='\033['

function echo_red() {
        COLOR_BACKGROUND=$RESET
        COLOR_TEXT=$TXT_RED
        echo -ne "${ESCAPE}${RESET}m"
        echo -ne "${ESCAPE}${COLOR_BACKGROUND};${COLOR_TEXT}m${@}"
        echo -ne "${ESCAPE}${RESET}m"
}

function echo_green() {
        COLOR_BACKGROUND=$RESET
        COLOR_TEXT=$TXT_GREEN
        echo -ne "${ESCAPE}${RESET}m"
        echo -ne "${ESCAPE}${COLOR_BACKGROUND};${COLOR_TEXT}m${@}"
        echo -ne "${ESCAPE}${RESET}m"
}

function echo_blue() {
        COLOR_BACKGROUND=$RESET
        COLOR_TEXT=$TXT_BLUE
        echo -ne "${ESCAPE}${RESET}m"
        echo -ne "${ESCAPE}${COLOR_BACKGROUND};${COLOR_TEXT}m${@}"
        echo -ne "${ESCAPE}${RESET}m"
}

function echo_yellow() {
        COLOR_BACKGROUND=$RESET
        COLOR_TEXT=$TXT_YELLOW
        echo -ne "${ESCAPE}${RESET}m"
        echo -ne "${ESCAPE}${COLOR_BACKGROUND};${COLOR_TEXT}m${@}"
        echo -ne "${ESCAPE}${RESET}m"
}
