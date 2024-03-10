docker run -d --name minio \
 -p 9000:9000 \
 -p 9090:9090 \
 -e "MINIO_ACCESS_KEY=admin" \
 -e "MINIO_SECRET_KEY=密码" \
 -v /root/minio/data:/data \
 minio/minio server /data --console-address ":9090" -address ":9000"

