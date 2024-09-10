#!/bin/sh
#####################################################################
# SCRIPT DE MONITORIA GENERICA
# CRIADO POR: VINÍCIOS ARAÚJO
# USO: 
# Ordem de Cores:
#	Branco - 47
#	Verde - 42
#	Azul claro - 46
#	Azul escuro - 44
#	Amarelo - 43
#	Vermelho - 41
#
#	SERVER: ANY
#####################################################################

#inicio

	while true; 
		do 
		clear; 

############
# Variáveis#
############

#	Nome do Servidor
		NAMESERVER=$(uname -a | awk '{print ($2)}')

#	Pesquisa PID do Asterisk
		PIDASTERISK=$(ps aux | grep /usr/sbin/asterisk | grep Sl | awk '{if (($11) == "/usr/sbin/asterisk") print ($2)}')

#	Arquivos abertos pelo sistema Operacional
#		SOOPENFILES=$(ls -l /proc/*/fd | wc -l)

#	Total de utilizacao do espaco em disco
		SIZE=$(df -h | grep "/dev/xvda2" | awk '{print ($5)}')
	
#       Firewall
                STATUS_FIREWALL=$(/sbin/iptables -L -n | grep "Chain INPUT")
                POLICY=$(/sbin/iptables -L -n | grep "Chain INPUT" | awk '{print ($4)}')

#	APACHE
                STATUS_HTTPD=$(ps aux | grep http | grep root | grep DFOREGROUND | awk '{print ($2)}')

#       LOAD AVERAGE
                LOAD1=$(cat /proc/loadavg | awk '{print ($1)}' | cut -d. -f1)
                LOAD2=$(cat /proc/loadavg | awk '{print ($2)}' | cut -d. -f1)
                LOAD3=$(cat /proc/loadavg | awk '{print ($3)}' | cut -d. -f1)
                SLOAD1=$(cat /proc/loadavg | awk '{print ($1)}')
                SLOAD2=$(cat /proc/loadavg | awk '{print ($2)}')
                SLOAD3=$(cat /proc/loadavg | awk '{print ($3)}')
                UPTIME=$(uptime | cut -d, -f1)

#	Inicio - Informacoes básicas

echo -e "\e[33;1m#Srv: $NAMESERVER \e[m"

                if [ "$STATUS_FIREWALL" = "Chain INPUT (policy DROP)" ]; then
                        echo -e "\e[33;1m#FIREWALL FECHADO: \e[m\e[42;1m ($POLICY \e[m";
                elif [ "$STATUS_FIREWALL" = "Chain INPUT (policy ACCEPT)" ]; then
                        echo -e "\e[33;1m#FIREWALL ABERTO: \e[m\e[41;1m ($POLICY \e[m";
                fi


#	Fim - Informacoes básicas
