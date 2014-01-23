#!jinja|yaml

# Base Packages needed
mypkgs:
  pkg.installed:
    - pkgs:
      - curl
      - mysql
      - installrvm
      - installapache 

#Install Apache
httpd:
  pkg:
    - installed
  service:
    - running
  require:
    - file: /etc/httpd/conf/httpd.conf
    - file: /etc/php.ini
    - file: /etc/httpd/conf.d/welcome.conf

# remove welcome.conf
/etc/httpd/conf.d/welcome.conf:
  file.absent:
    - name: /etc/httpd/conf.d/welcome.conf

# Install RVM
installrvm:
  cmd.script:
    - source: salt://rails/rvm.sh
    - stateful: true

# Install Ruby
installruby:
  cmd.script:
    - source: salt://rails/ruby.sh
    - stateful: true
  require:
    - pkg: installrvm  

# #install Passenger
# installpassenger:
#   cmd.script:
#     - source: salt://rails/passenger.sh
#     - stateful: true
#   require:
#     - pkg: installapache