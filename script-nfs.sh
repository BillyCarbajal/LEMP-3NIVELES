apt install nfs-kernel-server php php-fpm php-mysql php-zip php-dom php-intl php-curl php-mbstring php-gd unzip -y
mkdir -p /var/www/html
mkdir -p /var/www/moodledata
echo "/var/www       192.168.100.3(rw,sync,no_root_squash,no_subtree_check) 192.168.100.4(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
sed -i 's/^listen .*$/listen = 192.168.200.5:9000/' /etc/php/7.4/fpm/pool.d/www.conf
service nfs-kernel-server restart
cd /var/www/html
wget wget https://downloads.joomla.org/es/cms/joomla4/4-2-5/Joomla_4-2-5-Stable-Full_Package.zip
unzip Joomla_4-2-5-Stable-Full_Package.zip
rm Joomla_4-2-5-Stable-Full_Package.zip
chown -R www-data:www-data ../html
