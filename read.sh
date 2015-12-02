#!/usr/bin/env bash

source config.sh
ssh -o "ControlMaster=auto" -o "ControlPath=~/.ssh/connections/%r_%h_%p" -t $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER command ';' exec less -R +/"@$SSHCHAT_USERNAME" +F $SSHCHAT_ROOM
