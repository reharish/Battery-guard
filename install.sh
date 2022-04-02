#!/bin/sh

chmod +x battery
chmod +x batt.py
chmod +x batt-gui.sh

if test -f /usr/bin/bat;
then
    echo "Already Initialized"
    echo "Type bat to start"
else
    if cp batt-gui.sh $HOME/bat && sudo cp batt-gui.sh /usr/bin/bat ;then
        echo "##############################"
        sudo apt install zenity acpi 
        echo "##################################"
        zenity --info --width 400 --height 100 --title "Battery Pi" --text "Version : 1.5.0\nScripted :: reharish(github)\nABOUT:\nLithium-ion or lithium polymer batteries have certain life-cycles (i.e.,300 times, 0% to 100% and 100% to 0%) by maintaining a battery between 15% to 90% for long period leads in good battery life.\nBattery guard is a simple Shell script which protects laptop battery and give long battery life by notify user frequently about battery state while charging continuously for a prolonged period."
        zenity --info  --width 200  --title "INSTRUCTION" --text "1.Type 'cd' and Hit ENTER on terminal.\n2.Now you can run ./bat on Home Dir"
        echo
        echo
        echo "INSTALLED SUCCESSFULLY"
     fi
fi
exit 0
