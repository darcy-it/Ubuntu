#!/bin/bash
#
# file: main.sh
#
# func: ubuntu20.04-beep-sound-onoff
#
# set -e / false #

# backup file
File=/etc/inputrc.org
if [ -f "$File" ]; then  
    sudo cp /etc/inputrc /etc/inputrc.org
fi


# beep off
sudo sed -i -e "21s:^# ::" /etc/inputrc

# setting reflection
exec bash

sudo exit

