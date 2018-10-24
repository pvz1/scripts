#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
#sleep 5s
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
#sleep 2s
apt-get update
sleep 3s
apt-get --yes install curl
apt-get --yes install lsb-release

sh ./redis_ip_correction.sh &
sh ./redis-monitoring-setup.sh &
#sleep 30s
redis-server /conf/redis.conf 
#sleep 5s

