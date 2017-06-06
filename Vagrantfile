# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use a basic Ubuntu install
  config.vm.box = "bento/ubuntu-16.04"

  # Share our dev folder to the VM.
  # Note: This won't work, of course, if you're running Vagrant on Windows.
  # In the future we should add support for our default Windows development
  # directory.
  #config.vm.synced_folder "~/Developer/", "/Developer"
  config.vm.synced_folder "~/cawnfig", "/cawnfig"

  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
  end

  # Install vim from source
  config.vm.provision "shell",
    inline: "echo 'cd /cawnfig/scripts && ./install_all' >> /home/vagrant/install"
end
