#!/bin/sh
wget https://raw.githubusercontent.com/pvz1/scripts/master/redis_ip_correction.sh
#sleep 5s
#wget https://raw.githubusercontent.com/pvz1/scripts/master/redis-monitoring-setup.sh
#sleep 2s
sh ./redis_ip_correction.sh
#sleep 30s
redis-server /conf/redis.conf &
#sleep 2s
#sh ./redis-monitoring-setup.sh
apt-get install libhiredis0.10
(cd /opt/stackdriver/collectd/etc/collectd.d/ \
  && curl -O "https://raw.githubusercontent.com/Stackdriver/stackdriver-agent-service-configs/master/etc/collectd.d/redis.conf")
sudo service stackdriver-agent restart  
