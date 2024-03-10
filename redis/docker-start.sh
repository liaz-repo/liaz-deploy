#!/bin/bash
docker run --name liaz-redis \
 -p 6379:6379 \
 -v /etc/localtime:/etc/localtime \
 -v /root/redis/data/:/data -d redis --requirepass "密码"

