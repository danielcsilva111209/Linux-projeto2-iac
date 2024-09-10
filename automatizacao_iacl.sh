#!/bin/bash

echo "Criando diretorios..."

mkdir /vendas
mkdir /desenvolvimentos

echo "Criando grupos..."
groupadd projetosA
groupadd projetosB

echo "Criando usuarios..."

useradd ana -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G projetosA
useradd bruno -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G projetosA 
useradd carla -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G projetosB

chown root:projetosA /desenvolvimentos
chown root:projetosB /vendas

chmod 770 /desenvolvimentos
chmod 770 /vendas

echo "Finalizando...."
