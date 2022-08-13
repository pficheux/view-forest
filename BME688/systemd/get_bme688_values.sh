#!/bin/sh
# Read the data from BME 688 an publish in JSON format
#
#set -x

SERVER=test.mosquitto.org
#SERVER=192.168.1.18

TOPIC=view-forest-bme688

while [ 1 ]
do
    mosquitto_pub -h $SERVER -t $TOPIC -m "$(bme688 -j)"
    sleep 5
done
