#!/bin/bash
apt-get update
apt-get install ruby-notify sudo adduser usermod lsof
adduser --disabled-password --shell /bin/bash --gecos "CamIndicator Daemon User" --system --uid 850 --no-create-home camindicator
#echo "camindicator ALL=(ALL) NOPASSWD: $(which notify-send)">> /etc/sudoers
echo "">> /etc/sudoers
echo "# CamIndicator Sudo Definitions">> /etc/sudoers
echo "camindicator ALL=(ALL) NOPASSWD:SETENV: /usr/camindicator-notify">> /etc/sudoers
echo "camindicator ALL=(ALL) NOPASSWD:SETENV: $(which lsof)">> /etc/sudoers
echo camindicator:U6aMy0wojraho | sudo chpasswd -e
cp -v ./camindicator-notify /usr/camindicator-notify
echo "Setup done!"
