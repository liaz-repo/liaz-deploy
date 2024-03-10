#!/bin/bash
docker run -p 3306:3306 \
 --name liaz-mysql \
 -v /etc/localtime:/etc/localtime:ro \
 -v /etc/timezone:/etc/timezone:ro \
 -v /root/mysql/conf/:/etc/mysql/conf.d \
 -v /root/mysql/my.cnf:/etc/my.cnf \
 -v /root/mysql/log/:/logs \
 -v /root/mysql/data/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=密码 -d mysql:8.0

