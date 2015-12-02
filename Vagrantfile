# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "base"

  #I like it when my machines are patched
  config.vm.box_check_update = false

  # Enable private interface (should use DHCP)
  #config.vm.network "private_network", type: "dhcp", virtualbox__intnet: "vboxnet0"
  config.vm.network "private_network", type: "dhcp"

  # Customize the amount of memory on the VM:
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  #Ensure system fully patched when provisioning
   config.vm.provision "shell", run: "always" do |s|
    s.inline = "
		sudo apt-get update && sudo apt-get upgrade -y
    "
  end
end
