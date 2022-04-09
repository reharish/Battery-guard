#!/bin/bash

echo "Battery Guard 2.0"

printf "###############################\n"
printf "#- CLI MODE  -#\n"
printf "#- Leave it running -#\n"
printf "###############################\n"

Checking()
{
    charge='Charging'
    discharge='Discharging'
    StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)
    state=$(acpi | grep -P -o '[A-Za-z]+(?=,)')
    intStr=$(expr $StrBat)
}


while true
do
    Checking
    if [ $state == $charge ] ;
    then
	    if [ $intStr -ge 95 ] ;
	    then
		for i in `seq 1 5` ;
		do
			    StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)
			    intStr=$(expr $StrBat)
	     		    notify-send "Battery sufficiently Charged! $intStr "
			    echo "Battery sufficiently Charged! $intStr " | tee -a $LOG_FILE
			    sleep 30
		done
		break
	    fi
	    Checking
    else
	printf "Charger Not Connected !\n"
	exit 1
    fi
    sleep 30
done

exit 0
