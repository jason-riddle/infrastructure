# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # General VM configuration.
  config.vm.box = "geerlingguy/debian11"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Virtualbox VM configuration.
  config.vm.provider :virtualbox do |v|
    v.cpus = 1
    v.memory = 256
  end
end