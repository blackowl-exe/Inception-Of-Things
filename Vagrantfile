Vagrant.configure("2") do |config|

	config.vm.box = "generic/alpine318"
	
	config.vm.define "bkaztaouS" do |control|
		control.vm.hostname = "bkaztaouS"
		control.vm.network "private_network", ip: "192.168.56.110" 
		control.vm.provider "libvirt" do |vb|
			vb.default_prefix = ""
			vb.memory = "1024"
			vb.cpus = "1"
		end
		control.vm.provision "shell", path: "./config/setup-kernel-modules.sh"
		control.vm.provision :reload
		control.vm.provision "shell", path: "./config/setup-k3s-server.sh"
	end
	
	config.vm.define "bkaztaouSW" do |control|
		control.vm.hostname = "bkaztaouSW"
		control.vm.network "private_network", ip: "192.168.56.111"
		control.vm.provider "libvirt" do |vb|
			vb.default_prefix = ""
			vb.memory = "1024"
			vb.cpus = "1"
		end
		control.vm.provision "shell", path: "./config/setup-kernel-modules.sh"
		control.vm.provision :reload
		control.vm.provision "shell", path: "./config/setup-k3s-agent.sh"
	end

end
