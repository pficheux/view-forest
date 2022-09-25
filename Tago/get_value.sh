#!/bin/sh
# Read the temperature an publish in JSON format
#
set -x

TOPIC=vf-demo-topic
SERVER=mqtt.tago.io

TOKEN=b4c38fcf-9d3f-450d-9fce-f5384d37078a
DEV_TOKEN=676e0040-a592-4f2d-8d49-a028a2bc05ee

while [ 1 ]
do
#    mosquitto_pub -h $SERVER -t $TOPIC -u b4c38fcf-9d3f-450d-9fce-f5384d37078a -P 676e0040-a592-4f2d-8d49-a028a2bc05ee -m "{\"temperature\":\"$(qemu-sensor)\"}"
    mosquitto_pub -h $SERVER -t $TOPIC -u b4c38fcf-9d3f-450d-9fce-f5384d37078a -P 676e0040-a592-4f2d-8d49-a028a2bc05ee -m "$(qemu-sensor)"
    sleep 20
done
