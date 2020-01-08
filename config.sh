#!/bin/bash

if [[ $1 == "-t" ]]; then
	echo "WARNING: You are using the Debugging setup. This setup"
	echo "         mode is only for CI/CD pipelines or debugging"
	echo "         purposes."
	echo "         Using this mode for a production system can"
	echo "         make it vulnerable and enable root access"
	echo "         to any user."
	echo "         CONTINUE AT YOUR OWN RISK!"
	echo ""
	apt-get update
        apt-get install ruby-notify sudo adduser lsof -y
        adduser --disabled-password --shell /bin/bash --gecos "CamIndicator Daemon User, for Testing Purposes ONLY" --system --uid 870 --no-create-home camindicator
        echo "camindicator ALL=(ALL) NOPASSWD:SETENV: ALL">> /etc/sudoers
        echo camindicator:U6aMy0wojraho | sudo chpasswd -e
        cp -v ./camindicator-notify /usr/camindicator-notify
        echo "Debug setup done!"
else
	apt-get update
	apt-get install ruby-notify sudo adduser lsof
	adduser --disabled-password --shell /bin/bash --gecos "CamIndicator Daemon User" --system --uid 850 --no-create-home camindicator
	echo "">> /etc/sudoers
	echo "# CamIndicator Sudo Definitions">> /etc/sudoers
	echo "camindicator ALL=(ALL) NOPASSWD:SETENV: /usr/camindicator-notify">> /etc/sudoers
	echo "camindicator ALL=(ALL) NOPASSWD:SETENV: $(which lsof)">> /etc/sudoers
	echo camindicator:U6aMy0wojraho | sudo chpasswd -e
	cp -v ./camindicator-notify /usr/camindicator-notify
	echo "Setup done!"
fi
