apt install openssl nginx -y
cd /etc/nginx/
cp nginx.conf nginx.conf.backuppp
cat << EOF > nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;
events {
worker_connections 768;
# multi_accept on;
}
http {
upstream backend {
server 192.168.100.3;
server 192.168.100.4;
}
server {
listen 80;
listen [::]:80;
server_name _;
return 301 https://$host$request_uri;
}
server {
listen 443 ssl;
ssl_certificate /etc/nginx/certificadoss/clave.crt;
ssl_certificate_key /etc/nginx/certificadoss/clave.key;
location / {
proxy_pass http://backend;
}
}
}
EOF

mkdir certificadoss
cd certificadoss
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout clave.key -out clave.crt -subj "/CN=Servidor LEMP"
service nginx restart































