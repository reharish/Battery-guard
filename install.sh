#!/bin/bash

chmod +x battery

if sudo cp battery /usr/local/bin/
then
        echo "checking...."
        echo  ">"
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
else
    echo "Run as Sudoer or root to install"

fi

