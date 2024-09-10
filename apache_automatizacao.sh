#!/bin/bash

echo "Atualizando servidor..."

apt update

echo "Instalando apache2..."

apt install apache2 -y

echo "Instalando Unzip..."

apt install unzip -y

echo "Instalando a aplicação..."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip 
DIRETORIO="/tmp"

echo "Corrigindo dependências..."

apt-get install -f

echo "Copiando os arquivos da aplcação para os repositorios do apache"

git clone https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
cp -r * /var/www/html/

echo "Reniciando o apache.."

systemctl restart apache

echo "Encerrando.."
