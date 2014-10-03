#!/usr/bin/env bash


## COLOR & STYLE VARS
########################################

BLACK='30'
RED='31'
GREEN='32'
YELLOW='33'
BLUE='34'
WHITE='37'

NONE='00'
BOLD='01'
DULL='02'
UNDERLINE='04'


## FUNCTIONS
########################################

function format {

    # Get the message value
    MESSAGE=${1}

    # Get the color and style values
    COLOR=${2:-$WHITE}  # Defaults to black, if not specified.
    STYLE=${3:-$NONE}   # Defaults to none, if not specified.
    BG=${4:-$BLACK}     # Defaults to black, if not specified.

    # Echo the message with specified colors
    echo -e "\033[${STYLE};${COLOR}m${MESSAGE}\033[00m"
    return

}
