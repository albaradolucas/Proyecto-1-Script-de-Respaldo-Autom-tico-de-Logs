#!/bin/bash

# copiar los archivos de /var/log/ a un dir de respaldo
# crear /backup/log/AAAAMMDD/
# copiar todos los .log ahí
# comprimir la carpeta en .tar.gz
# registrar en un archivo backup.log la fecha y si fue exitoso

date_mdfy=$(date +%Y%m%d)
log_dir='/var/log/'
find_log=$(find ${log_dir} -name '*.log' 2>/dev/null)
dir_bkp="/backup/log/$date_mdfy"

if [ -z "$find_log" ]; then
        sleep 1
        echo ""
        echo "No hay archivos para copiar"
        sleep 2
        exit
else
        sleep 1
        echo ""
        mkdir -p "$dir_bkp"
        for log in $find_log; do cp -v "$log" "$dir_bkp/"; done
        sleep 1
        echo "Se copiaron los archivos al directorio '$dir_bkp'"

        tar -cvzf "$dir_bkp".tar.gz -C /backup/log "$date_mdfy"

        if [ $? -eq 0 ] ; then

                echo "$date_mdfy | Estado OK" >> /backup/backup.log

                if [ -s "$dir_bkp".tar.gz ]; then
                        rm -rf /backup/log/"$date_mdfy"

                        echo "Tarea finalizada ok"
                        sleep 2
                fi
        else
                echo "$date_mdfy | Estado Not OK" >> /backup/backup.err
                sleep 1
                echo ""
                echo "Hubo un error en la compresión de la carpeta"
                echo "Revisar '/backup/backup.err'"
                sleep 2
        fi
fi

exit
