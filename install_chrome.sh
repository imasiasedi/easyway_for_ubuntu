#!/bin/bash
function update(){
	apt update
	apt upgrade -y
	apt autoremove -y
}

update

wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} http://dl.google.com/linux/chrome/deb/ stable main"
echo $text >> /etc/apt/sources.list.d/google-chrome.list

update

apt install google-chrome-stable -y