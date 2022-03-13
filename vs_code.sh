#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

function install_vscode(){
	echo "---> Creando APT Source  ... "
	text="deb ${archtype} https://packages.microsoft.com/repos/code stable main"
	echo $text >> /etc/apt/sources.list.d/vscode.list
	echo "---> VScode Key ... "
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	echo "---> Actualizando ... "
	update > /dev/null
	echo "---> Instalando Paquetes ... "
	apt-get install apt-transport-https code -y > /dev/null
	echo ""
}

echo "Instalando VScode ..."
install_vscode
echo "Enjoy 3:)"