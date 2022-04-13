#!/bin/bash

######################################
# Name : Battery Guard GUI
# Author : @reharish
# Description : Build over Zenity
#             Protects laptop Battery
#             from excessive charging.
######################################

VERSION="1.4.1"
LOG_FILE="$HOME/.battery-guard.log"

if ! [ -f $LOG_FILE ]
then
    touch $LOG_FILE
    zenity --info --width 400 --height 50 --title "Battery Pi" --text "GUI-Version : $VERSION \n Script : reharish(github) \n \nThe script protects laptop battery and give long battery life by notify user frequently about battery state while charging it continuously."
    echo "Battery Guard Initiated" >> $LOG_FILE
    date >> $LOG_FILE
    echo "###########"
fi


Checking()
{
    charge='Charging'
    discharge='Discharging'
    StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)
    state=$(acpi | grep -P -o '[A-Za-z]+(?=,)')
    intStr=$(expr $StrBat)
}

Checking
if [ $state == $discharge ];
then
    zenity --warning --width 300 --height 50 --text "Battery : $intStr % \n \nPlease CONNECT to Power and RUN again"
    date >> $LOG_FILE
    echo "WARNING :: Charger not Connected" >> $LOG_FILE
    exit 1
elif zenity --question --width 300 --height 30 --title "Confirm" --text "This script will run in background it will consume less than 4MB of RAM \n \n continue ?/"
then
    zenity --notification --text "Battery-Guard Successfully Started"
    echo "STARTED :: Battery Guard Started   " >> $LOG_FILE
    date >> $LOG_FILE

    while [ $state == $charge ];
    do
	Checking
	if [ $state == $charge ] ;
	then
	    if [ $intStr -ge 93 ] ;
	    then
		for i in `seq 1 5` ;
		    do
			Checking
			if [ $state == $charge ] ;
			then
			    StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)

			    intStr=$(expr $StrBat)

			    zenity --notification --text "Sufficiently Charged $intStr % "
			    zenity --warning --width 300 --height 30 --text "Battery : $intStr % \n \nProlonged Charging cause serious defect on battery and performance.\n \nplease unplug the charger"
			    echo "SUCCESS :: Sufficiently Charged $intStr % " >> $LOG_FILE
			    sleep 20
			fi
		done
		break

	    fi
	else
	    date >> $LOG_FILE
	    echo "Charger unpluged !!!!"
	    break
	fi
	sleep 30
	checking
    done
fi

exit 0
