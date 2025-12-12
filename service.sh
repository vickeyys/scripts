#/bin/bash

SERVICE=apache2.service

if ! systemctl is-active --quiet "$SERVICE";
then
    echo "service is down starting it...."
    systemctl start "$SERVICE"

    if systemctl is-active --quiet "$SERVICE";
    then
        echo "service started successfully.."
    else
        echo "service failed to start $SERVICE"
    fi 
else
    echo "service $SERVCIE already running.."
fi
