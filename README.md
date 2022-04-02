# Battery-guard
Battery Guard For Linux Laptops.

Lithium-ion or lithium polymer batteries have certain life-cycles (i.e.,300 times 0% to 100% and 100% to 0%) by maintaining a battery between 15% to 90% leads to good battery life.Battery guard is a simple Shell script which protects laptop battery and gives long battery life by notifying user frequently about battery state while charging continuously for a prolonged period.
### requirements
  * ACPI (Advanced Configuration and Power Interface) pakage
## Installation
**YouTube Tutorial**

[![Battery Guard](https://i.ytimg.com/vi/g9D9gAw4wxc/hqdefault.jpg)](https://www.youtube.com/watch?v=g9D9gAw4wxc "Link")

run install.sh code as root or sudoers
` bash install.sh`
This command copy the script to PATH variable of linux

## Usage

**GUI(Graphical version 1.5.0)**
Type `bat` anywhere in terminal.which is optimized with gui `zenity`
minimize the terminal the script will run as long the terminal opens

**CLI(command Line Version 2.0)**
Type `batt.py` anywhere in terminal.the script is written in `python3`
minimize the terminal the script will run as long the terminal opens

## Additional Options
**Bash**  
- you can run batt.sh by `bash batt.sh`  
**Python3**  
- run a python script by `python3 batt.py`  
**on the go version**  
- run battery-lite shell script `bash battery-lite`


Note: Scripted and Tested on ubuntu 20.04 stable 
