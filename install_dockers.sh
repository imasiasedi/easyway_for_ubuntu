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
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y > /dev/null
	echo "---> Permisos Usuario ... "
	groupadd docker
	usermod -aG docker $USER
	chmod 666 /var/run/docker.sock
	echo ""
}

function install_docker_desktop(){
	echo "---> Docker Desktop  ... "
	wget -q https://desktop.docker.com/linux/main/amd64/docker-desktop-4.17.0-amd64.deb
	apt sudo apt --fix-broken install ./docker-desktop-4.17.0-amd64.deb -y
	echo "---> Eliminando Paquetes ... "
	rm docker-desktop-4.17.0-amd64.deb
	echo ""
}

function kvm_virtualization(){
    kvm_type=$(lsmod | grep kvm)
    echo "---> Instalando KVM virtualization support ${version} ... "
    if [ ${kvm_type:0:9} == 'kvm_intel' ]; then
        modprobe kvm_intel > /dev/null
    else 
        modprobe kvm_amd > /dev/null
    fi
	usermod -aG kvm $USER
}


echo "Instalando Dockers ..."
install_docker
install_docker_desktop
kvm_virtualization
echo "Enjoy 3:)"