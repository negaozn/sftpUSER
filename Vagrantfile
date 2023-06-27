Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos8"
  config.vm.network "forwarded_port", guest: 22, host: 2222  # Forward SSH port

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"  # Adjust the memory as needed
  end

  # Provision the server and configure SFTP
  config.vm.provision "shell", inline: <<-SHELL
    dnf -y update
    dnf -y install openssh-server

    # Edit SSH configuration to enable SFTP
    sed -i 's/#Subsystem/Subsystem/' /etc/ssh/sshd_config
    echo "Match user vagrant\n  ForceCommand internal-sftp\n  PasswordAuthentication yes" >> /etc/ssh/sshd_config

    # Restart SSH service
    service ssh restart
  SHELL
end
