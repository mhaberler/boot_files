DTC=dtc

DTS_SRCS =  $(wildcard *.dts)

TARGET =  $(patsubst %.dts,%.dtb,$(DTS_SRCS)) 


all: $(TARGET) 


%.dtb: %.dts
	$(DTC) -I dts -O dtb -o $@ $<

kernel.dts: /proc/device-tree 
	dtc -I fs -O dts /proc/device-tree -o kernel_dts

