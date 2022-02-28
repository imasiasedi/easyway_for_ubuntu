#!/bin/bash
function update(){
	apt update
	apt upgrade -y
	apt autoremove -y
}

update

apt-get install gnupg -y

if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse"
echo $text >> /etc/apt/sources.list.d/mongodb.list
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

update

apt install mongodb mongodb-clients -y

#sudo ufw allow 27017/tcp

#Mongo Gui (Optional)
#apt install  gconf-service gconf-service-backend gconf2-common libgconf-2-4
#wget https://downloads.mongodb.com/compass/mongodb-compass_1.30.1_amd64.deb
#dpkg -i mongodb-compass_1.30.1_amd64.deb
