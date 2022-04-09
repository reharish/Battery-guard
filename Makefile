Name = battery-guard
version = 1.4.1+ubuntu+All
description = Protect Laptop battery from Excessive Charging.

install_dir = /usr/share/$(Name)
exe_dir = /usr/local/bin

build:
	mkdir -p ./build/$(install_dir)
	mkdir -p ./build/$(exe_dir)
	cp batt-gui.sh ./build/$(install_dir)/$(Name)-gui
	cp batt.sh ./build/$(install_dir)/$(Name)-cli
	cp LICENSE ./build/$(install_dir)/
	cp trigger.sh ./build/$(exe_dir)/$(Name)

deb: build
	fpm -s dir -t deb -n $(Name)				\
		-v $(version)                         	\
		--maintainer "58879939+reharish@users.noreply.github.com"   	\
		-C "build/" -a noarch                  				\
		-d acpi                  		\
		-d zenity				\
		--url "https://reharish.github.io/cv"           		\
		--description "$(description)"        		\
		--after-install script/install.sh 	\
		--after-remove script/remove.sh	\
		.

clean:
	rm -f *~
	rm -rf build/
	rm -f *.deb
	rm -f build.tar
