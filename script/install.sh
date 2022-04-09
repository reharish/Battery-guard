#!/bin/bash

NAME="battery-guard"
VERSION="1.4.1"
LOG_FILE="$HOME/.battery-guard.log"

chmod +x /usr/local/bin/$NAME

chmod +x /usr/share/$NAME/battery-guard*

if [[ -z ${BATTERY_GUARD_HOME} ]]
then
    export BATTERY_GUARD_HOME="/usr/share/$NAME"
fi

if test -f /usr/local/bin/$NAME;
then
    zenity --info --width 400 --height 100 --title "Battery guard" --text "Version : $VERSION \nScripted :: reharish(github)\nABOUT:\nLithium-ion or lithium polymer batteries have certain life-cycles (i.e.,300 times, 0% to 100% and 100% to 0%) by maintaining a battery between 15% to 90% for long period leads in good battery life.\nBattery guard is a simple Shell script which protects laptop battery and give long battery life by notify user frequently about battery state while charging continuously for a prolonged period."
fi

exit 0
