apt install nginx nfs-common -y
echo "192.168.100.5:/var/www       /var/www      nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab
mount 192.168.100.5:/var/www /var/www
cd /etc/nginx/sites-available
rm default
touch default
cat << EOF > default
server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }

        # pass PHP scripts to FastCGI server
        #
        location ~ \.php\$ {
               include snippets/fastcgi-php.conf;
        #
        #       # With php-fpm (or other unix sockets):
        #       fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        #       # With php-cgi (or other tcp sockets):
               fastcgi_pass 192.168.200.5:9000;
        }

}
EOF
service nginx restart




