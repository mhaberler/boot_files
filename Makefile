DTC=dtc

DTS_SRCS =  $(wildcard *.dts)

TARGET =  $(patsubst %.dts,%.dtb,$(DTS_SRCS)) 


all: $(TARGET) kernel.dts


%.dtb: %.dts
	$(DTC) -I dts -O dtb -o $@ $<

kernel.dts: /proc/device-tree 
	dtc -I fs -O dts /proc/device-tree -o kernel.dts

update-uboot: u-boot-with-spl.sfp
	dd if=u-boot-with-spl.sfp of=/dev/mmcblk0p1 conv=notrunc

