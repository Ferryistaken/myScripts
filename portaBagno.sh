#!/usr/bin/bash

if [ `curl -s -X GET --header "Accept: text/plain" "http://192.168.3.16:8080/rest/items/bathroomDoor/state"` = "OPEN" ];then
	echo "⚠Door is open"; notify-send "Porta Bagno" "La porta del bagno e' aperta"
else
	echo ""
fi

