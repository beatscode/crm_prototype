sudo yum update;
sudo yum install curl;
sudo curl -L get.rvm.io | bash -s stable;
# If you ran the installer as root, run:
source /usr/local/rvm/rvm.sh;
echo "changed=yes comment='I hope rvm was installed properly'";