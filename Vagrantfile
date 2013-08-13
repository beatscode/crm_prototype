Vagrant.configure("2") do |config|

  config.vm.define :web do | web |
    web.vm.box = "centos63"
    web.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130427.box"
    web.vm.synced_folder "salt/roots/", "/srv/"
  
    web.vm.provision :salt do |salt|
      salt.verbose = true
      salt.run_highstate = true
      salt.minion_config = "salt/web-minion"
    end
  end

end


Vagrant::Config.run do |config|

  config.vm.define :web do |web|
    #web.vm.network :hostonly, "192.168.1.11"
    #web.vm.box = "centos63"
    web.vm.forward_port 5000, 3333 ,id:"http1"
    web.vm.share_folder "path", "/var/www/html", "."
    web.vm.share_folder "database_files", "/home/vagrant/db/dumps/", "db/dumps/"
  end

end