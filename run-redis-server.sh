#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
sh ./redis_ip_correction.sh &
sh ./redis-monitoring-setup.sh &
redis-server /conf/redis.conf 


