#!/bin/bash

DAEMON="/kamailio/sbin/kamctl"

echo "Starting Kamailio..."
mkdir -p /var/run/kamailio
${DAEMON} start
sleep 3

# Monitor loop
while true; do
    sleep 10
    if ! pgrep -x kamailio > /dev/null; then
        echo "Kamailio died, restarting..."
        sleep 30
        mkdir -p /var/run/kamailio
        ${DAEMON} start
        sleep 3
    fi
done
