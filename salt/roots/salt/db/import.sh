USERNAME=root
PW='root'
HOST=localhost
PATH=/home/vagrant/db/dumps/
MYSQL=/usr/bin/mysql
$MYSQL -u$USERNAME -p$PW -h $HOST contentLibrary < ${PATH}images_2013-08-12.sql;
$MYSQL -u$USERNAME -p$PW -h $HOST contentLibrary < ${PATH}leonardo_2013-08-13.sql;