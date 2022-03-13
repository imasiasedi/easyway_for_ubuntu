#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

function install_vivaldi(){
	echo "---> Creando APT Source  ... "
	text="deb ${archtype} https://repo.vivaldi.com/archive/deb/ stable main"
	echo $text >> /etc/apt/sources.list.d/vivaldi.list
	echo "---> Vivaldi Key ... "
	wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
	echo "---> Actualizando ... "
	update > /dev/null
	echo "---> Instalando Paquetes ... "
	apt-get install vivaldi-stable -y > /dev/null
	echo ""
}

echo "Instalando Vivaldi ..."
install_vivaldi
echo "Enjoy 3:)"