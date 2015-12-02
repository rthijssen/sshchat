#!/bin/bash

source config.sh

USERNAME=$1

# $1 is message color, $2 is message
function cecho {
	echo -e "\e[1;95m[$(date)] $SSHCHAT_USERNAME:\e[0m $1$2"
}

ssh -o "ControlMaster=auto" -o "ControlPath=~/.ssh/connections/%r_%h_%p" $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER -p $SSHCHAT_SERVER_PORT "touch $SSHCHAT_ROOM"
cecho "\033[33;32m" "-=[ JOINED $SSHCHAT_ROOM" | ssh -o "ControlMaster=auto" -o "ControlPath=~/.ssh/connections/%r_%h_%p" $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER -p $SSHCHAT_SERVER_PORT "cat >> $SSHCHAT_ROOM"

while [ true ]
do
    echo -n "$ ";
    read input;

    if [ "$input" == "exit" ]
    then
		cecho "\033[33;32m" "-=[ LEFT $SSHCHAT_ROOM" | ssh -o "ControlMaster=auto" -o "ControlPath=~/.ssh/connections/%r_%h_%p" $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER -p $SSHCHAT_SERVER_PORT "cat >> $SSHCHAT_ROOM"
        screen -S sshchatwindow -X quit
    fi

    cecho "" "$input" | ssh -o "ControlMaster=auto" -o "ControlPath=~/.ssh/connections/%r_%h_%p" $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER -p $SSHCHAT_SERVER_PORT "cat >> $SSHCHAT_ROOM"
done
