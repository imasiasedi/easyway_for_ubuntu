#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null

wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} http://dl.google.com/linux/chrome/deb/ stable main"
echo $text >> /etc/apt/sources.list.d/google-chrome.list

update

apt install google-chrome-stable -y

function install_chrome(){
	echo "---> Creando APT Source  ... "
	text="deb ${archtype} https://packagecloud.io/shiftkey/desktop/any/ any main"
	echo $text >> /etc/apt/sources.list.d/google-chrome.list
	echo "---> Github Desktop Key ... "
	wget -qO- https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
	echo "---> Actualizando ... "
	update > /dev/null
	echo "---> Instalando Paquetes ... "
	apt-get install github-desktop -y > /dev/null
	echo ""
}

echo "Instalando Chrome ..."
install_chrome
echo "Enjoy 3:)"