# Raspbian
#PYTHON = python3.9

# Yocto 3.1
PYTHON = python3.8

PYTHON_DIR = $(SDKTARGETSYSROOT)/usr/include/$(PYTHON)

BME68X_DIR= BME68x-Sensor-API

#CFLAGS= -Wall -Wno-unused-but-set-variable -Wno-unused-variable -std=c99 -pedantic -O2 -I$(PYTHON_DIR) -DPF
CFLAGS= -O2 -I$(PYTHON_DIR) -DPF

SRCS= $(BME68X_DIR)/bme68x.c bme688.c 
PROGS= bme688

$(PROGS): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -lm -lrt -lwiringPi -l$(PYTHON) -o $@

install:
	mkdir -p $(DESTDIR)/usr/bin
	cp $(PROGS) $(DESTDIR)/usr/bin

clean: 
	rm -f *~ $(PROGS)
