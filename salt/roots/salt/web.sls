#!jinja|yaml

# Base Packages needed
mypkgs:
  pkg.installed:
    - pkgs:
      - curl
      - mysql
      - installrvm
      - installapache 

# Install Apache
installapache:
  cmd.script:
    - source: salt://web/apache.sh
    - stateful: false

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


# Start rails
startrails:
  cmd.script:
    - source: salt://rails/startapp.sh
    - stateful: true
  require:
    - pkg: mypkgs          