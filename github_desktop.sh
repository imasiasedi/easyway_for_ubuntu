#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi

function install_gith_desk(){
	echo "---> Descargando Paquetes  ... "
	wget -q https://github.com/shiftkey/desktop/releases/download/release-3.0.5-linux1/GitHubDesktop-linux-3.0.5-linux1.deb
	echo "---> Instalando Paquetes  ... "
	dpkg -i GitHubDesktop-linux-3.0.5-linux1.deb
	echo "---> Eliminando Paquetes ... "
	rm GitHubDesktop-linux-3.0.5-linux1.deb
	echo ""
}

echo "Instalando Github Desktop ..."
install_gith_desk
echo "Enjoy 3:)"