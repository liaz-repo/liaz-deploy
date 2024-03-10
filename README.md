# liaz-deploy
# 修改mysql下docker-start.sh
```
#!/bin/bash
docker run -p 3306:3306 \
 --name liaz-mysql \
 -v /etc/localtime:/etc/localtime:ro \
 -v /etc/timezone:/etc/timezone:ro \
 -v /root/mysql/conf/:/etc/mysql/conf.d \
 -v /root/mysql/my.cnf:/etc/my.cnf \
 -v /root/mysql/log/:/logs \
 -v /root/mysql/data/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=密码 -d mysql:8.0
```
# 修改redis下docker-start.sh
```
#!/bin/bash
docker run --name liaz-redis \
 -p 6379:6379 \
 -v /etc/localtime:/etc/localtime \
 -v /root/redis/data/:/data -d redis --requirepass "密码"
```
# 修改nacos下docker-start.sh
```
docker run -d --name nacos \
 -p 8848:8848 \
 -p 9848:9848 \
 -p 9849:9849 \
 --privileged=true \
 -e JVM_XMS=256m \
 -e JVM_XMX=512m \
 -e MODE=standalone \
 -e SPRING_DATASOURCE_PLATFORM=mysql \
 -e MYSQL_SERVICE_HOST=mysql的IP地址 \
 -e MYSQL_SERVICE_PORT=3306 \
 -e MYSQL_SERVICE_DB_NAME=nacos \
 -e MYSQL_SERVICE_USER=root \
 -e MYSQL_SERVICE_PASSWORD=mysql密码 \
 -e NACOS_AUTH_IDENTITY_KEY=security \
 -e NACOS_AUTH_IDENTITY_VALUE=serverIdentity \
 -e NACOS_AUTH_TOKEN=SecretKey012345678901234567890123456789012345678901234567890123456789 \
 -v /root/nacos/logs/:/home/nacos/logs/ \
 -v /root/nacos/conf/:/home/nacos/conf/ \
 -v /root/nacos/data/:/home/nacos/data/ --restart=alwaysnacos/nacos-server
```
# 修改minio下docker-start.sh
```
docker run -d --name minio \
 -p 9000:9000 \
 -p 9090:9090 \
 -e "MINIO_ACCESS_KEY=admin" \
 -e "MINIO_SECRET_KEY=密码" \
 -v /root/minio/data:/data \
 minio/minio server /data --console-address ":9090" -address ":9000"
```
