# requires plugin "vagrant-reload"

jammy = "ubuntu/jammy64"
master_ip = "192.168.56.10"
minion1_ip = "192.168.56.11"

Vagrant.configure("2") do |config|
  # config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "master" do |master|
    master.vm.box = jammy
    master.vm.network "private_network", ip: master_ip
    config.vm.synced_folder "shared_dir/master/", "/shared"

    master.vm.provision "shell", privileged: true, inline: "hostnamectl set-hostname master"
    master.vm.provision "shell", privileged: true, path: "./provisioning/hostfile.sh"
    master.vm.provision :reload
    master.vm.provision "shell", privileged: true, path: "./provisioning/install_salt.sh"
    master.vm.provision "shell", privileged: true, path: "./provisioning/master.sh"
  end

  config.vm.define "minion1" do |m1|
    m1.vm.box = jammy
    m1.vm.network "private_network", ip: minion1_ip
    m1.vm.provision "shell", privileged: true, inline: "hostnamectl set-hostname m1"
    m1.vm.provision "shell", privileged: true, path: "./provisioning/hostfile.sh"
    m1.vm.provision :reload
    m1.vm.provision "shell", privileged: true, path: "./provisioning/install_salt.sh"
    m1.vm.provision "shell", privileged: true, path: "./provisioning/minion_base.sh"
    m1.vm.provision "shell", privileged: true, inline: "/usr/local/bin/salt-minion -d"
  end
end