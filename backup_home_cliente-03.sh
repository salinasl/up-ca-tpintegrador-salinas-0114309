#!/bin/bash
# SCRIPT COPIA DE ARCHIVOS DEL HOME DEL CLIENTE-03

if ping -c 1 192.168.20.3 &> /dev/null
then
	echo "Cliente-03 online -- Ejecutando RSYNC"
	fecha=$(date +%F_%H-%M-%SZ)
	rsync -v --stats -a -h -t --exclude=.cache --delete lsalinas@192.168.20.3:/home /backups/ > /root/logs/backup_home_cliente-03.sh_$fecha.log
else
	echo "Cliente-03 offline -- No se ejecuta RSYNC"
fi
