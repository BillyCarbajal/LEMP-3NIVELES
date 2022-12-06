apt install default-mysql-server -y
mysql -u root << EOF
create database lemp_db;
create user 'lemp_user'@'%' identified by 'lemp_password';
grant all privileges on *.* to 'lemp_user';
flush privileges;
EOF
sed -i 's/bind-address .*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql restart