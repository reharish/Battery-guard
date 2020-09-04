#!/bin/bash

chmod +x battery
if test -f /usr/local/bin/battery;then

    echo " Already Initialized"
    
    echo "Type battery to start"
    
    
else

    if sudo cp battery /usr/local/bin/;then
        echo "checking...."
        sleep 1
        echo  -n ">"
        sleep 2
        echo  -n ">"
        sleep 1
        echo  -n ">"
        sleep 1
        echo  -n ">"
        sleep .5
        echo  -n ">"
        sleep 1
        echo  -n ">"
        sleep .4
        echo  -n ">"
        sleep .4
        echo  ">"
        sleep .4
        echo "HALF OF INSTALLATION DONE"
        sleep 1
        echo "##############################"
        sudo apt install zenity acpi
        
        echo "##################################"
        echo
        echo
        echo done
     fi

fi
