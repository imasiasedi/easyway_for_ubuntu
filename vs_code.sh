#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://packages.microsoft.com/repos/code stable main"

echo $text >> /etc/apt/sources.list.d/vscode.list

update

apt install apt-transport-https code -y