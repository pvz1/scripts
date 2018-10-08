#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
sleep 2s
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
sleep 2s
sh ./redis_ip_correction.sh &
sleep 10s
redis-server /conf/redis.conf &
sleep 10s
sh ./redis-monitoring-setup.sh

