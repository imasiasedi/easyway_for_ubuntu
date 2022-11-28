#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

USER="${SUDO_USER:-${USER}}"
source_list=/etc/apt/sources.list.d
gpgkey_path=/etc/apt/trusted.gpg.d

update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

function install_docker(){
	echo "---> Creando APT Source  ... "
	text="deb ${archtype} https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	echo $text >> $source_list/docker.list
	echo "---> Docker Key ... "
	wget -qO- https://download.docker.com/linux/ubuntu/gpg | gpg --dearmour -o $gpgkey_path/docker.gpg
	echo "---> Actualizando ... "
	update > /dev/null
	echo "---> Instalando Paquetes ... "
	apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y > /dev/null
	echo "---> Permisos Usuario ... "
	groupadd docker
	usermod -aG docker $USER
	chmod 666 /var/run/docker.sock
	echo ""
}

function install_compose(){
	#Para instalar compose
	wget -qO /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64
	chmod +x /usr/local/bin/docker-compose
}

echo "Instalando Dockers ..."
#install_docker
install_compose
echo "Enjoy 3:)"