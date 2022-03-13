#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null

function install_gith_desk(){
	echo "---> Creando APT Source  ... "
	text="deb ${archtype} https://packagecloud.io/shiftkey/desktop/any/ any main"
	echo $text >> /etc/apt/sources.list.d/shiftkey-desktop.list
	echo "---> Github Desktop Key ... "
	wget -qO- https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
	echo "---> Actualizando ... "
	update > /dev/null
	echo "---> Instalando Paquetes ... "
	apt-get install github-desktop -y > /dev/null
	echo ""
}

echo "Instalando VScode ..."
install_gith_desk
echo "Enjoy 3:)"