#!/bin/sh

redis-server /conf/redis.conf &

# TODO: Wait until redis-server process is ready
sleep 10
