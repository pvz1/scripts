#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
# Redis monitor script should run after the redis-server setup to successfully send the metrics to stack driver agent. 
# But when we run both scripts in foreground redis-server setup interupts monitor script and fails the setup. 
# Due to this issue we are running the monitor script in background and redis-server run command in foreground. And also kubernetes pods keep restarts if there is no foreground process is running in it. 
sh ./redis_ip_correction.sh &
sh ./redis-monitoring-setup.sh &
redis-server /conf/redis.conf 


