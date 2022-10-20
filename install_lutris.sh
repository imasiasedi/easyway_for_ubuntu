#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

LTRS=lutris-all.deb

function install_lutris(){
	echo "---> Descargando Paquetes  ... "
	wget -qO $LTRS https://github.com/lutris/lutris/releases/download/v0.5.12-beta1/lutris_0.5.12_beta1_all.deb
    echo "---> Install ... "
	dpkg -i $LTRS > /dev/null
	echo "---> Actualizando ... "
	update > /dev/null
	echo ""
}

echo "Instalando Lutris ..."
install_lutris
echo "Enjoy 3:)"
