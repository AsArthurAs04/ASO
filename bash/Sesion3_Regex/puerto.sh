#!/bin/bash
# Ejercicio 1. ¿Es un número de puerto?
# Escribe puerto.sh, que recibe un número de puerto como parámetro y dice si es válido.
# Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# Comprueba con una expresión regular que el parámetro solo tiene dígitos.
# Si son dígitos, comprueba que el número está entre 1 y 65535.
# $ ./puerto.sh 22
# 22 es un puerto válido
# $ ./puerto.sh 80a
# 80a no es un número
# $ ./puerto.sh 70000
# 70000 está fuera de rango (1-65535)
if [ -z "$1" ]; then
    echo "Uso: ./puerto.sh <puerto>"
    exit 1
fi
 
puerto="^[0-9]+$"

if ! [[ $1 =~ $puerto ]]; then
    echo "$1 no es un número"

elif (( $1 > 65535 )); then
    echo "$1 está fuera de rango (1-65535)"

else
    echo "$1 es un puerto válido"

fi