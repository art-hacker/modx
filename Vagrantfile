Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_check_update = false

    config.vm.network "forwarded_port", guest: 80, host: 80 # www
	
    config.vm.provider "virtualbox" do |vb|
        # vb.gui = false
        vb.memory = "2048"
        vb.cpus = 4
    end

    config.vm.synced_folder ".", "/vagrant"
    config.vm.synced_folder "./www", "/var/www/site"
    
    config.vm.provision :shell, path: "provision.sh"
end
