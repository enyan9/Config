#https://wiki.archlinux.org/title/Wakeup_triggers
#https://unix.stackexchange.com/questions/417956/make-changes-to-proc-acpi-wakeup-permanent
#lsusb | grep "Logitech"
echo 'ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c545", ATTR{power/wakeup}="disabled"' | sudo tee  /etc/udev/rules.d/logitech-receiver.rules
