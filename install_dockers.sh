#!/bin/bash
function update(){
	apt update
	apt upgrade -y
	apt autoremove -y
}

update

if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo $text >> /etc/apt/sources.list.d/docker.list
wget -qO- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
