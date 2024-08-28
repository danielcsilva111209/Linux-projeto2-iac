#!/bin/bash

echo "Criando usuários do sistema...."

useradd guest10 -c"Usuário COnvidado" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd guest 10 -e

useradd guest11 -c"Usuário COnvidado" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd guest 11 -e

useradd guest12 -c"Usuário COnvidado" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd guest 12 -e

useradd guest13 -c"Usuário COnvidado" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd guest 13 -e

echo "\nFinalizando!!"
