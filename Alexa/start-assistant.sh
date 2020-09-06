#!/bin/bash

ALEXA_FOLDER="/home/pi/DIY-Echo-Show/Alexa"

_psName2Ids(){
    ps -aux | grep -i "$1" | awk '{print $2}'
}

psKill(){
     _psName2Ids $1 | xargs sudo kill -9 > /dev/null 2>&1;
}

processes=($(_psName2Ids "alexa-screen.py"))
if [ ${#processes[@]} -le 1 ]; then
    cd "$ALEXA_FOLDER"
    psKill "alexa-screen.py"
    sudo screen -dmS ss sudo python3 /home/pi/DIY-Echo-Show/Alexa/alexa-screen.py
fi;
