#!/bin/bash
registrar(){
    local mensaje="$1"
    local hora=$(date +%T)
    echo "$hora $mensaje"
    logger -t aso-backup "$mensaje"

}
DESTINO="${1:-/var/backups}"
MAX_COPIAS="${2:-7}"

if [ ! -d "$DESTINO" ]; then
    registrar "Error"
    exit 1
fi

if [ "$MAX_COPIAS" -le 0 ]; then
    registrar "Error tiene que ser mayor que 0"
    exit 1
fi

FECHA=$(date +%Y%m%d-%H%M%S)
FICHERO="etc-$FECHA.tar.gz"
RUTA_COMPLETA="$DESTINO/$FICHERO"

tar -czf "$RUTA_COMPLETA" /etc 2>/dev/null

if [ $? -eq 0 ]; then
    registrar "Copia creada: $RUTA_COMPLETA"
else
    registrar "Error al crear la copia de seguridad"
    exit 1
fi

# Contar copias con ls y grep -cE cumpliendo el formato exacto
contador=$(ls -1 "$DESTINO" 2>/dev/null | grep -cE '^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$' || true)

# Mostrar aviso si se supera el máximo recomendado
if [ "$contador" -gt "$MAX_COPIAS" ]; then
    registrar "Aviso: hay $contador copias y el máximo recomendado es $MAX_COPIAS"
fi