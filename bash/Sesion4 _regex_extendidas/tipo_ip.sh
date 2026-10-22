#!/bin/bash
if [[ $# -eq 0 ]]; then
echo "Uso: $0 ip"
exit 1
fi
re_loopback='^127\.'
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'
if [[ $1 =~ $re_loopback ]]; then
echo "$1 es una dirección loopback"
elif [[ $1 =~ $re_privada ]]; then
echo "$1 es una dirección privada"
else
echo "$1 es una dirección pública"
fi