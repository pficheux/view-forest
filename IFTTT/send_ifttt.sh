#!/bin/sh
#
# Send an IFTTT event
#
#set -x

if [ $# -lt 2 ]; then
    echo "Usage: $0 <sensor-id> <temperature>"
    exit 1
fi

SENSOR_ID=$1
TDEG=$2

# IFTTT parameters
KEY=nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr
EVENT=gmail

curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = '$SENSOR_ID'", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/$EVENT/with/key/$KEY
