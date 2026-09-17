#!/bin/bash
bytes_usados=$1
bytes_totales=$2
porcentaje=$(($bytes_usados * 100 / $bytes_totales))

if [ $porcentaje -lt 70 ]; then
 echo "OK"
elif [ $porcentaje -lt 90 ]; then
 echo "AVISO"
else
 echo "CRITICO"
fi
