#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <carpeta_remota>"
    exit 1
fi

FECHA=$(date +%F_%H-%M)
DESTINO=~/backups/espejo
LOG=~/backups/backup.log

mkdir -p ~/backups

escribir_log() {
    echo "$FECHA - Carpeta: $1 - $2" >> $LOG
}

ssh -o BatchMode=yes servidor true 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error de conexion"
    escribir_log "$1" "Fallo conexion"
    exit 1
fi

rsync -av servidor:$1/ $DESTINO/

if [ $? -eq 0 ]; then
    escribir_log "$1" "Copia OK"
else
    escribir_log "$1" "Fallo copia"
    exit 1
fi