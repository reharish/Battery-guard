#!/bin/bash
echo "Battery Guard 2.0"
echo
echo "###############################"
echo "#- Info !!! Leave it running -#"
echo "###############################"
charge='Charging'
discharge='Discharging'

while true
do
	StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)
	state=$(acpi | grep -P -o '[A-Za-z]+(?=,)')
	intStr=$(expr $StrBat)
	if [ $state == $charge ] ;
	then
		if [ $intStr -ge 95 ] ;
		then
			for i in `seq 1 5` ; 
			do
				StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)

				intStr=$(expr $StrBat)
				
				notify-send "Battery sufficiently Charged! $intStr "
				
				sleep 200
			done
			break
		
		fi
	fi
	sleep 300
done
