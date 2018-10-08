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
apt-get update
apt-get --yes install curl
apt-get --yes install lsb-release

CODENAME="$(lsb_release -sc)"
REPO_HOST=${STACKDRIVER_REPO_HOST:-repo.stackdriver.com}
curl -s -S -f -o /etc/apt/sources.list.d/stackdriver.list "https://${REPO_HOST}/${CODENAME}.list" || { \
    echo "Could not fetch sources file."; \
    echo "Please check your network connectivity and"; \
    echo "make sure you are running a supported Ubuntu/Debian distibution."; \
    exit 1; \
  }
curl -s -f https://dl.google.com/cloudagents/RPM-GPG-KEY-stackdriver | apt-key add -

apt-get -qq update

# Install the agent package, without prompting for an API key.
DEBIAN_FRONTEND=noninteractive \
apt-get -y -q install --allow-unauthenticated stackdriver-agent
apt-get install libhiredis0.10
(cd /opt/stackdriver/collectd/etc/collectd.d/ \
  && curl -O "https://raw.githubusercontent.com/Stackdriver/stackdriver-agent-service-configs/master/etc/collectd.d/redis.conf")
service stackdriver-agent restart  
