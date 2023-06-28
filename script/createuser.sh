#!/bin/bash

# Prompt for user input

#read -p "Enter username: " USERNAME
#read -s -p "Enter password: " PASSWORD
echo


# Variables
USERNAME="teste"
PASSWORD="teste"
HOMEDIR="/incoming/$USERNAME"
GROUP="sftpusers"
DIR="/sftpusers/$USERNAME"

# Create folder if this not exists
if [ ! -d "/incoming" ] ; then
    echo "criando incoming"
    mkdir -p "/incoming"
else
    echo "incoming ja existe"
fi

if [ ! -d "/sftusers" ] ; then
    echo "criando sftpusers"
    mkdir -p "/sftpusers"
else
    echo "sftpusers ja existe"
fi

groupadd sftpusers
chown root:$GROUP /sftpusers
chmod 777 /sftpusers


# Create user
useradd -d $HOMEDIR -s /bin/bash $USERNAME
# mkdir $HOMEDIR
echo "$USERNAME:$PASSWORD" | chpasswd

# sudo -u $USERNAME ssh-keygen -t rsa -b 4096
# sudo -u $USERNAME openssl rand -base64 16

echo -e "\n" | sudo -u $USERNAME ssh-keygen -t rsa -b 4096
#echo "$password" | sudo -u $USERNAME openssl rand -base64 16

# mv $HOMEDIR /sftpusers/

sudo usermod -G $GROUP -d $HOMEDIR -s /bin/bash $USERNAME

 

# sudo groupdel $USERNAME

# cd /$GROUP

# chmod 755 /$USERNAME

# cd /$USERNAME

# chown $USERNAME:sftpusers .bash_history .bash_logout .bash_history .cache .bashrc .config .rnc

# chown $USERNAME:root .ssh

# chmod 700 .ssh 

# cd .ssh/

# chown $USERNAME:root id_rsa id_rsa.pub

# touch autorized_keys

# chown $USERNAME:sftpusers autorized_keys

# chmod 600 autorized_keys

# cd ..

# mkdir /$DIR/incoming/

# chown $USERNAME:sftpusers incoming/

# chmod 750 incoming/

# echo "User $USERNAME has been created."