sudo yum install ruby-devel < <(yes y);
sudo yum install curl-devel < <(yes y);
sudo yum install pcre-devel < <(yes y);
sudo gem install passenger;
rvmsudo passenger-install-apache2-module;
sudo mkdir /etc/httpd/sites-available;
sudo mkdir /etc/httpd/sites-enabled;
# sudo passenger start -p 81

# sudo cat "
# LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.2.3/ext/apache2/mod_passenger.so
# PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.2.3
# PassengerRuby /usr/bin/ruby" > /etc/httpd/conf.d/passenger.conf