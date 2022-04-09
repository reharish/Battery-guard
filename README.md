# Battery-guard
Battery Guard For Linux Laptops.

Lithium-ion or lithium polymer batteries have certain life-cycles (i.e.,300 times 0% to 100% and 100% to 0%) by maintaining a battery between 15% to 90% leads to good battery life.Battery guard is a simple Shell script which protects laptop battery and gives long battery life by notifying user frequently about battery state while charging continuously for a prolonged period.

### requirements
  * ACPI (Advanced Configuration and Power Interface) pakage
  * zenity

### Installation
**New Version**
 1. Clone the git repo:

    $ git clone https://github.com/reharish/Battery-guard
    $ cd zdeck

  2. Create the debian package.

    $ make deb

  3. Install the package.

    $ sudo apt install battery-guard*.deb
      	or 
    $ dpkg -i battery-guard*.deb
	
**YouTube Tutorial - old**

[![Battery Guard](https://i.ytimg.com/vi/g9D9gAw4wxc/hqdefault.jpg)](https://www.youtube.com/watch?v=g9D9gAw4wxc "Link")

## Usage

**GUI(Graphical version 1.4.1)**
Type `battery-guard` on terminal. Which will trigger the gui version of Battery-Guard.

**CLI(command Line Version)**
Type `battery-guard cli` anywhere in terminal. Which will run the cli version.

## Additional Options
**Bash**  
- you can run batt.sh by `bash batt.sh`  

**Python3**  
- run a python script by `python3 batt.py`  


Note: Scripted and Tested on ubuntu 20.04 stable 
