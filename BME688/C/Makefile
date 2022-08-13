PYTHON = python3.9
PYTHON_DIR = /usr/include/$(PYTHON)
BME68X_DIR= BME68x-Sensor-API

CFLAGS= -Wall -Wno-unused-but-set-variable -Wno-unused-variable -std=c99 -pedantic -O2 -I$(PYTHON_DIR) -DPF

SRCS= $(BME68X_DIR)/bme68x.c bme688.c 
PROGS= bme688

$(PROGS): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -lm -lrt -lwiringPi -l$(PYTHON) -o $@

clean: 
	rm -f *~ $(PROGS)
