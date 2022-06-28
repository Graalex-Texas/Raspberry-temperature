#!/bin/bash

#echo "Voici la température : $(vcgencmd measure_temp)"


printf "%-30s%10s\n" "TIMESTAMP" "TEMP(degC)"
printf "%20s\n" "--------------------------------------"

while true
do
	temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
	timestamp=$(date '+%F // %H:%M:%S')
	printf "%-30s%5s\n\n" "$timestamp" "$temp"
	echo "$timestamp $temp" >> /home/pi/Desktop/log-temp
	sleep 1

done
