#!/bin/sh
#
# Get the temperature from a MPC9808 sensor and send an alarm with IFTTT
# Don't send the alarm if already sent before SEND_DELAY
#
#set -x

# Running in demo mode (x86)
DEMO=1

TMAX=30
SLEEP_T=5
DATE_ALARM=0
DATE_C=0
SEND_DELAY=60
TDEG_O=0

# Sensor ID
SENSOR_ID=$(hostname)

# IFTTT parameters
KEY=nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr
EVENT=gmail

if [ $DEMO -eq 0 ]; then
    F=/sys/class/hwmon/hwmon0/temp1_input
else
    echo "Running in demo mode !"
    F=/tmp/t
fi

echo "Using file $F"

while [ 1 ];
      do
	  # Get the temp value
	  T=$(cat $F)
	  TDEG_O=$TDEG
	  TDEG=$(expr $T / 1000)
	  DATE_C=$(date +%s)
	  if [ $TDEG -gt $TMAX ]; then
	      D=$(expr $DATE_C - $DATE_ALARM)
	      echo "Delay since last alarm is $D / $SEND_DELAY"
	      # Send an alarm if delay > (alarm time - current time)
	      if [ $D -gt $SEND_DELAY ]; then
  	          echo "*** Sending ALARM ($TDEG / $TDEG_O °C) !!!"
		  DATE_ALARM=$(date +%s)
		  if [ $DEMO -eq 0 ]; then
		      curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = '$SENSOR_ID'", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/$EVENT/with/key/$KEY
		  fi    
	      else
		  echo "alarm already sent !"
	      fi
	  else
	      echo "OK :-) ($TDEG / $TDEG_O °C)"
	  fi 
	  sleep $SLEEP_T
done


