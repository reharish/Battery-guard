#!/bin/bash


zenity --info --width 400 --height 50 --title "Battery Pi" --text "GUI-Version : 1.4.1 \n Script : reharish(github) \n \nThe script protects laptop battery and give long battery life by notify user frequently about battery state while charging it continuously."

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
	echo "WARNING :: Please connect to Power"
elif zenity --question --width 300 --height 30 --title "Confirm" --text "This script will run in background it will consume less than 4MB of RAM \n \n continue ?"
then
	zenity --notification --text "    Battery-Pi Successfully Started   "
	echo "###############################"
	echo "    Battery-Pi 1.5.0  GUI        "
	echo "###############################"
	echo "    STARTED :: Battery Pi Started   " >> battery.log
	date >> battery.log
    while [ $state == $charge ];
    do
	    Checking
	    if [ $state == $charge ] ;
	    then
		    if [ $intStr -ge 93 ] ;
		    then
			    for i in `seq 1 5` ; 
			    do
				    StrBat=$(acpi | cut -d " " -f 4 | cut -d "%" -f 1)
                    
				    intStr=$(expr $StrBat)
				    
				    zenity --notification --text "sufficiently Charged $intStr % "
				    zenity --warning --width 300 --height 30 --text "Battery : $intStr % \n \nProlonged Charging cause serious defect on battery and performance.\n \nplease unplug the charger"
				    echo "SUCCESS :: sufficiently Charged $intStr % " >> battery.log
				    sleep 20
			    done
			    break
		   
	    fi
	    sleep 30
	    else
		
		    date >> battery.log
		    echo "charger unpluged !!!!"
		    break
	    	fi
    done  
fi
