#!/usr/bin/python3

import sys,os
from time import sleep
import subprocess as sp

#File-Handling
logger=open("battery.log","a")

#Banner
def banner():
    return "###############################\n    BatteryPi 2.0          \n###############################\n"

print(banner())
logger.write(banner())
print('initiating......')
charge='Charging'
discharge='Discharging'


    
def printer():
    date=sp.getoutput('date')
    logger.write(date+'\n')
'''print(percentage)
print(State)'''
def Notifier():
    notify='notify-send "Battery sufficiently Charged"'
    os.system(notify+str(percentage))
    
percentage=0
State=""
con=0


while True:
    percentage=int(sp.getoutput('(acpi | cut -d " " -f 4 | cut -d "%" -f 1)'))
    State=sp.getoutput("acpi | grep -P -o '[A-Za-z]+(?=,)'")
    con=con+1
    printer()
    logger.write('|-')
    print(str(con),'Checked...',State,percentage,"%")
    report=str(con)+'Checked...'+State+str(percentage)+"%"+'\n'
    logger.write(report)
    if State == 'Charging' and percentage > 95:
        logger.write('| |+')
        for i in range(10):
            logger.write('|  | |+')
            percentage=int(sp.getoutput('(acpi | cut -d " " -f 4 | cut -d "%" -f 1)'))
            State=sp.getoutput("acpi | grep -P -o '[A-Za-z]+(?=,)'")
            if State == "Charging" and percentage > 95 :
                printer()
                percentage=int(sp.getoutput('(acpi | cut -d " " -f 4 | cut -d "%" -f 1)'))
                State=sp.getoutput("acpi | grep -P -o '[A-Za-z]+(?=,)'")
                Notifier()
                sleep(3*60)
            else :
                break
    sleep(5*60)            
    
            
