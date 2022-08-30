#!/bin/sh
set -x

TMAX=30
SLEEP_T=5
DATE_ALARM=0
DATE_ALARM_OLD=0

while [ 1 ];
      do
	  # Get the temp value
	  T=$(cat /sys/class/hwmon/hwmon0/temp1_input)
	  TDEG=$(expr $T / 1000)

	  if [ $TDEG -gt $TMAX ]; then
	      DATE_ALARM_OLD=$DATE_ALARM
	      DATE_ALARM=$(date +%s)
	      echo "ALARM ($TDEG °C) !!!"
	      if [ $(expr $DATE_ALARM - $DATE_ALARM_OLD) -ge 10 ]; then
		  curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = 123456", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/gmail/with/key/nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr
#		  echo "curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = 123456", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/gmail/with/key/nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr"
	      else
		  echo "alarm already sent !"
	      fi	  
	  fi

	  sleep $SLEEP_T
done


