#!/usr/bin/sh

connections="ss | grep -i ssh"

oldConnections=`eval "$connections" | wc -l`
#echo "first oldConnections"

while true; do
	newConnections=`eval "$connections" | wc -l`
	if [ $oldConnections -eq $newConnections ]; then
		:
	elif [ $newConnections -gt $oldConnections ]; then
		notify-send --icon=gtk-info SSH "New ssh connection($newConnections)"
		#echo "new connection"
		#echo ""
		#echo "oldConnections: $oldConnections"
		#echo "newConnections: $newConnections"
		(sleep 3; /home/ferry/Documents/scripts/removeNotifications.sh) &
		#echo "after sleep"
		oldConnections=$newConnections
	elif [ $newConnections -lt $oldConnections ]; then
		if [ `ss | grep -i ssh | wc -l` -eq "0" ]; then
			notify-send --icon=gtk-info SSH "No more clients connected"
			(sleep 3; /home/ferry/Documents/scripts/removeNotifications.sh) &
			oldConnections=$newConnections
		else
			notify-send --icon=gtk-info SSH "1 or more clients disconnected"
			(sleep 3; /home/ferry/Documents/scripts/removeNotifications.sh) &
			oldConnections=$newConnections
		fi
	fi
	sleep 1
	export SSH_CONNECTIONS=$newConnections
done


