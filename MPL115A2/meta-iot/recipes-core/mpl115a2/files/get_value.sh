#!/bin/sh
# Read the temperature an publish in JSON format
#

SERVER=test.mosquitto.org
TOPIC=view-forest

while [ 1 ]
do
    mosquitto_pub -h $SERVER -t $TOPIC -m "{\"time\":\"$(date +"%d/%m/%y %H:%M:%S")\", \"temperature\":\"$(mpl115a2)\"}"
    sleep 5
done
