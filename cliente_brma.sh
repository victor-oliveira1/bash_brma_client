#!/bin/bash
#Cliente BRMA escrito em bash.
#Programas utilizados:
#curl
#telnet
#
#TODO: Implementar a criptografia do applet: CryptP.class
#victor.oliveira@gmx.com

ip_server="INSERIR ENDEREÇO IP"
usuario="INSERIR USUARIO AQUI"
senha="INSERIR SENHA AQUI"

curl -s "http://${ip_server}:10001/cgi/loginaux.cgi" \
	--data "acao=login" \
	--data "CRYPT=0" \
	--data "USERNAME=${usuario}" \
	--data "PASSWORD=${senha}"

#Mantém a conexão a cada 480 segundos (8 minutos)
while :; do
	echo "Mantendo conexão..."
	(sleep 1; echo -ne "${usuario}\nKeepAlive\n"; sleep 1)| telnet ${ip_server} 10002
	sleep 480
