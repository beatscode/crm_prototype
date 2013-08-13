rvm install 1.9.3;
rvm use 1.9.3 --default;
sudo gem update;
sudo gem update --system;
sudo gem install rails 3.2.13 < <(yes y);
echo "changed=yes comment='I hope rails was installed properly'";