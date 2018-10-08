#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
sleep 5s
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
sleep 5s
sh ./redis_ip_correction.sh &
redis-server /conf/redis.conf &
sleep 30s
sh ./redis-monitoring-setup.sh &


