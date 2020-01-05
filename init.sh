#!/bin/bash

if [[ $(whoami) == "root" ]]; then
	echo "# User check suceeded"
else
	echo "# This program can only be run by root"
	exit
fi

if [[ $1 == "start" ]]; then
	echo "Starting CamIndicator Daemon..."
	nohup ./camindicatord> /dev/null&
	exit
fi

if [[ $1 == "attach" ]]; then
        echo "Starting CamIndicator in attached mode..."
        ./camindicatord
        exit
fi

if [[ $1 == "stop" ]]; then
	echo "Stopping CamIndicator Daemon..."
	pkill camindicatord
#	pkill camindicator
echo "" | ./camindicator-wrapper --stdin --user=camindicator pkill camindicator
echo "" | ./camindicator-wrapper --stdin --user=camindicator pkill cami-monitor
	exit
fi

echo $1: unknown action
