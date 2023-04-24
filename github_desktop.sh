#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

version=GitHubDesktop-linux-3.2.1-linux1.deb
update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

function install_gith_desk(){
	echo "---> Descargando Paquetes  ... "
	wget -q https://github.com/shiftkey/desktop/releases/download/release-3.2.1-linux1/$version
	echo "---> Instalando Paquetes  ... "
	dpkg -i $version
	echo "---> Eliminando Paquetes ... "
	rm $version
	echo ""
}

echo "Instalando Github Desktop ..."
install_gith_desk
echo "Enjoy 3:)"