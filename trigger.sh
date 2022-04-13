#!/bin/bash

# Trigger script for makes Battery Guard run in GUI or CLI. 

VERSION="1.4.1"
LOG_FILE="$HOME/.battery-guard.log"

if [[ -z ${BATTERY_GUARD_HOME} ]]
then
    export BATTERY_GUARD_HOME="/usr/share/battery-guard"
fi


help_text()
{
    printf "\n"
    printf "Usage: $0  [cli | help | stop]\n"
    printf "Debug: $0 log\n"
    printf "\n"
    exit 2
}

checking_pid()
{
    pgrep -P $(pgrep -f battery-gua) 2>/dev/null
}


if [ "$#" == "0" ]
then
    if checking_pid >/dev/null
    then
	echo "Already Runing"
    else
	if $BATTERY_GUARD_HOME/battery-guard-gui 2& >/dev/null
	then
	    echo "Started"
	    exit 0
	fi
    fi

elif [ "$1"  == "cli" ]
then
    if checking_pid >/dev/null
    then
	echo "Already Running"
    else
       $BATTERY_GUARD_HOME/battery-guard-cli
    fi

elif [ "$1" == "stop" ]
then
    if checking_pid >/dev/null
    then
	kill -9 $(pgrep battery-gua)
    else
	echo "Not Running"
    fi

elif [ "$1" == "help" ]
then
    printf "#################\n"
    printf "# Battery Guard #\n"
    printf "#################\n"
    help_text

elif [ "$1" == "log" ]
then
    less $LOG_FILE

else
    printf "Invalid Argument\n"
    help_text
fi
exit 0
