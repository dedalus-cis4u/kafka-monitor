#!/bin/bash

LOCATION=$(pwd)
cd webapp || exit
echo "Starting HTTPS server for Kafka Monitor GUI on 0.0.0.0:80"
python -m http.server 80 &

cd $LOCATION || exit

/opt/kafka-monitor/kafka-monitor-docker-entry.sh