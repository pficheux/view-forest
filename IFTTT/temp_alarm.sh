#!/bin/sh
#
# Get the temperature from a MPC9808 sensor and send an alarm with IFTTT
# Don't send the alarm if already sent before SEND_DELAY
#
set -x

TMAX=30
SLEEP_T=5
DATE_ALARM=0
DATE_ALARM_OLD=0
SEND_DELAY=10
KEY=nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr
EVENT=gmail

while [ 1 ];
      do
	  # Get the temp value
	  T=$(cat /sys/class/hwmon/hwmon0/temp1_input)
	  TDEG=$(expr $T / 1000)

	  if [ $TDEG -gt $TMAX ]; then
	      DATE_ALARM_OLD=$DATE_ALARM
	      DATE_ALARM=$(date +%s)
	      echo "ALARM ($TDEG °C) !!!"
	      if [ $(expr $DATE_ALARM - $DATE_ALARM_OLD) -ge $SEND_DELAY ]; then
		  curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = 123456", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/$EVENT/with/key/$KEY
	      else
		  echo "alarm already sent !"
	      fi	  
	  fi

	  sleep $SLEEP_T
done


