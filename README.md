# The "View Forest"  project

## Description

### Context

The evolution of the climate leads us to be very attentive to the preservation of our natural heritage. During the
summer 2022, there was an explosion of the number of fires all around the world, including Europe and France. The south west
of France is very famous for the "forêt de Landes" (The Landes Forest) wich is considered as one of the biggest in Europe.

The forest is shared between the departements of Gironde, Landes and Lot-et-Garonne (Nouvelle Aquitaine). The area is about 1000000 ha. In july 2022, two major fires in Gironde destroyed more than 20000 ha in La Teste-de-Buch and Landiras.

### Goal

The the goal of the project is to develop and install a connected system in order to detect a "start of fire" in a forest and send an alarm to the local fire department. In a final version, a dashboard will be provided in order to check the data during a period of time.

Here are the prerequistes:

- Using cheap hardware such as common microcontrollers based boards (ESP32, RP2040) with low power consumption
- Using a LPWAN network to send the data (LoRA, Sigfox, NB-IOT, LTE-M)
- Open source software (and hardware if necessary) !

## Current status

The current repository includes 2 simple demonstrations on Raspberry Pi:

- ```Yocto``` MQTT demo using a MPL115A2 sensor and sending the temperature to "test.mosquitto.org" using the "view-forest" topic (Yocto based)
- ```BME688``` MQTT demo using a BME688 sensor and sending the values (temperature, pressure, hygrometry, gas resistance) to "test.mosquitto.org" using the "view-forest-bme688" topic




