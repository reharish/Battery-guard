Name = battery-guard
version = 1.5.0+Linux+All
description = Protect Laptop battery from Excessive Charging.

install_dir = /usr/share/battery-guard
exe_dir =/usr/local/bin

build:
	mkdir build/
	mkdir -p build/$(install_dir)
	mkdir -p build/$(exe_dir)
	cp -a batt-gui.sh build/$(install_dir)/battery-guard-gui
	cp -a batt.sh build/$(install_dir)/battery-guard-cli
	cp -a LICENSE README.md trigger.sh build/$(install_dir)/
	chmod +x build/$(install_dir)/*.sh
	cp -a trigger.sh build/$(exe_dir)/battery-guard
	chmod +x build/$(exe_dir)/battery-guard

deb: build
	fpm -s dir -t deb -n $(Name)				\
		-v $(version)                         	\
		--maintainer "58879939+reharish@users.noreply.github.com"   	\
		-C "build/" -a noarch                  				\
		-d acpi                  		\
		-d zenity				\
		--url "https://reharish.github.io/cv"           		\
		--description "$(description)"        		\
		--after-install deb_script/postinst.sh 	\
		--after-remove deb_script/postrm.sh	\
		.

clean:
	rm -f *~
	rm -rf build/
