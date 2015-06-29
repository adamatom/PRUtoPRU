# PRU to PRU test

Requires pypruss

compile and load device tree with:
``` bash
dtc -O dtb -o /lib/firmware/P8_27_P8_15-00A0.dtbo -b 0 -@ ./P8_27_P8_15-00A0.dts
echo P8_27_P8_15 >/sys/devices/bone_capemgr.9/slots
```

Makefile will not work unless you clone this into the pypruss/examples/ dir.
