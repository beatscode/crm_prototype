sudo yum install httpd < <(yes y);
sudo chkconfig --levels 235 httpd on;
sudo /usr/sbin/apachectl start;
# find /etc/httpd/conf/httpd.conf -type f -exec sed -i 's/oldstr/newstr/g' {} \;
# sudo /usr/sbin/apachectl restart;
echo "changed=yes comment='I hope apache was installed properly'";