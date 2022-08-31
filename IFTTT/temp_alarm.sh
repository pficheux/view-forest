#!/bin/sh
#
# Get the temperature from a MPC9808 sensor and send an alarm with IFTTT
# Don't send the alarm if already sent before SEND_DELAY
#
#set -x

TMAX=30
SLEEP_T=5
DATE_ALARM=0
DATE_C=0
SEND_DELAY=10
TDEG_O=0

KEY=nyGTOHaJMnkXJhgIVHrxPaL6CFuCDgLMhcSAbBc7ozr
EVENT=gmail

while [ 1 ];
      do
	  # Get the temp value
	  #T=$(cat /sys/class/hwmon/hwmon0/temp1_input)
	  T=$(cat /tmp/t)
	  TDEG_O=$TDEG
	  TDEG=$(expr $T / 1000)
	  DATE_C=$(date +%s)
	  if [ $TDEG -gt $TMAX ]; then
	      D=$(expr $DATE_C - $DATE_ALARM)
	      echo "Delay since last alarm is $D"
	      if [ $D -gt $SEND_DELAY ]; then
  	          echo "ALARM ($TDEG / $TDEG_O °C) !!!"
		  DATE_ALARM=$(date +%s)
#		  curl -k -X POST -H "Content-Type: application/json" -d '{"value1":"sensor_id = 123456", "value2":"temperature = '$TDEG' °C"}' https://maker.ifttt.com/trigger/$EVENT/with/key/$KEY
	      else
		  echo "alarm already sent !"
	      fi
	  else
	      echo "OK :-) ($TDEG / $TDEG_O °C)"
	  fi 
	  sleep $SLEEP_T
done


