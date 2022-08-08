# The "View Forest"  project

## Description

### Context

The evolution of the climate leads us to be very attentive to the preservation of our natural heritage. During the
summer 2022, there was an explosion of the number of fires all around the world, including Europe and France. The south west
of France is very famous for the "forêt de Landes" (The Landes Forest) wich is considered as one of the biggest in Europe.

The forest is shared between the departements of Gironde, Landes and Lot-et-Garonne (Nouvelle Aquitaine). The area is about 1000000 ha. In july 2022, two major fires in Gironde destroyed more than 20000 ha in La Teste-de-Buch and Landiras.

### Goal

The the goal of the project is to develop and install a connected system in order to detect a "start of fire" in a forest and send an alarm to the local fire department.

Here are the prerequistes:

- Using cheap hardware such as common microcontrollers based boards (ESP32, RP2040) with low power consumption
- Using a LPWAN network to send the data (LoRA, Sigfix, NB-IOT, LTE-M)
- Open source software (and hardware if necessary) !

## Fire detection principles

Fire is a complex physico-chemical process resulting from the interaction between a fuel (in our case the trees) and an oxidizer (the oxygen in the air).
This oxidation-reduction reaction requires an activation energy and is characterized by a strong production of heat and light. These three elements are essential to maintain
combustion and tThis principle is commonly illustrated by the fire triangle. The fire triangle or combustion triangle is a simple model for understanding the necessary ingredients
for most fires (see https://en.wikipedia.org/wiki/Fire_triangle).

The products formed by combustion are  carbon dioxide (CO2) and water (H2O). On the other hand, when the oxidant is in default with respect to the stoichiometric composition, the fuel
does not burn in its entirety and the combustion is said to be incomplete or reducing. The main products of combustion are then carbon dioxide (CO2), water (H2O) and a
complex set of gases (the most abundant of which are carbon monoxide (CO), methane (CH4), carbon monoxide nitrogen (NO)), volatile and non-volatile compounds and aerosols.

Therefore, a fire can be detected using the following criteria

- temperature (ambient or infrared detection)
- smoke / gas (CO2, CO, etc.)


### Camera based system

Such a system is based on the "Fire lookout tower" concept which has been used for a long time (See https://www.fs.usda.gov/detail/r1/recreation/?cid=fsp5_030804).
Instead of having a man watching an event around, the camera records a video and
provides an realtime image analysis. Such a system relies on visual recognition of smoke. It can detect fires only if a large smoke plume is visible. Additionnaly it does not work at night.

Some systems are installed in the Landes department.

### Sensor based system

The sensor (IoT) base approach is new as it needs several criterias:

- a low power sensor (no power supply in the forest !)
- a low power network (no Wi-Fi in the forest)

As there could be some calculation to do, the data will be sent to the Internet through an IoT platform (It's not possible to do a calculation on the sensor
because of power consumption).


## Project architecture

TBD

## Planning

TBD

## Project Team

TBD




