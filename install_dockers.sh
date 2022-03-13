#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

text="deb ${archtype} https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo $text >> /etc/apt/sources.list.d/docker.list
wget -qO- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#Permisos a Usuario en Modo Super Usuario
usermod -aG docker $USER
newgrp - docker

#Para instalar compose
#sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
