obj-m	:= kernel_injector.o
kernel_injector-y := main.o device_handlers.o ioctl.o shellcode_injector.o
 
KERNELDIR ?= ~/workspace/buildroot-2020.02.4/output/build/linux-4.19.91
PWD       := $(shell pwd)
 
all: debug
 
release:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

debug:
	CFLAGS=-g
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions debug
