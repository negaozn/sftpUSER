Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos8"
  #config.vm.network "forwarded_port", guest: 22, host: 2200  # Forward SSH port

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"  # Adjust the memory as needed
  end

  # Provision the server and configure SFTP
  # config.vm.provision "shell", inline: <<-SHELL
  # dnf -y update
  # dnf -y install openssh-server

  # # Edit SSH configuration to enable SFTP and password authentication for Vagrant
  # sed -i 's/#Subsystem/Subsystem/' /etc/ssh/sshd_config
  # echo "ForceCommand internal-sftp\n  PasswordAuthentication yes" >> /etc/ssh/sshd_config
  # echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

  # # Restart SSH service
  # systemctl restart sshd
  # SHELL
  # config.vm.provision "shell", privileged: true, path: "./script/sftp.sh"
  config.vm.provision "shell", privileged: true, path: "./script/createuser.sh"
end
