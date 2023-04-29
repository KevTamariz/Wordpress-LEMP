#!/bin/bash

# This is a script to backup wordpress site and mariadb

USERNAME=ktamariz
HOST1="192.168.100.143" #VM Wordpress
HOST2="192.168.100.140" #VM MARIADB


# Se define el script de backup de wordpress
SCRIPT_WP="tar cvf backup_wp_`date +%F`_`date +%M`_`date +%S`.tar /var/www/html/wordpress/;
mv *tar backups/; scp -r backups/ ktamariz@192.168.100.144:/home/ktamariz/;
rm /home/ktamariz/backups/*tar"


# Se define el script de backup de mariadb
SCRIPT_BD="echo -e '990414' | sudo -S mysqldump --databases testbd > backup.sql;
tar cvf backup_bd_`date +%F`_`date +%M`_`date +%S`.tar backup.sql;
rm backup.sql;
mv *tar backups_bd/; scp -r backups_bd/ ktamariz@192.168.100.144:/home/ktamariz/;
rm /home/ktamariz/backups_bd/*tar"


# se ejecuta el script de wordpress por ssh
for HOSTNAME in ${HOST1} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT_WP}"
done


# se ejecuta el script de mariadb por ssh
for HOSTNAME in ${HOST2} ; do
    ssh -l ${USERNAME} ${HOSTNAME} "${SCRIPT_BD}"
done