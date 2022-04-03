#!/bin/bash

# Trigger script for making Battery Guard available in gui & cli.

checking_pid()
{
    pgrep battery-g >/dev/null	
}


if [ "$#" -eq 0 ]
then
    if checking_pid
    then
	echo "Already Runing"
    else
	if /usr/share/battery-guard-gui  >/dev/null
	then
	    echo "Started"
	fi
	fi
elif [ "$1"  == "cli" ]
then
    if checking_pid
    then
	echo "Already Running"
    else
       /usr/share/battery-guard-cli
    fi
elif [ "$1" == "kill" ]
then
    if checking_pid
    then
	kill -9 $(pgrep battery-gua)
    else
	echo "Not Running"
    fi
elif [ "$1" == "help" ]
then
    echo "#################"
    echo "# Battery Guard #"
    echo "#################"

    echo "Usage: $0  [ cli | help ]"
else 
    echo "Invalid Options"
fi

    
