#!/usr/bin/env bash

echo "Welcome...";
source config.sh

ssh $SSHCHAT_SERVER_USERNAME@$SSHCHAT_SERVER -p $SSHCHAT_SERVER_PORT "touch $SSHCHAT_ROOM"

export SSHCHAT_USERNAME;


screen -c screenrc
