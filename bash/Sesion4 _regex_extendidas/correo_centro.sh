#!/bin/bash
if [[ $# -eq 0 ]]; then
echo "Uso: $0 correo"
Página 1 de 3
exit 1
fi
re='^[a-z0-9._-]+@(alu\.)?edu\.gva\.es$'
re_alumnado='@alu\.edu\.gva\.es$'
if [[ $1 =~ $re ]]; then
if [[ $1 =~ $re_alumnado ]]; then
echo "$1 es una cuenta de alumnado"
else
echo "$1 es una cuenta de profesorado"
fi
else
echo "$1 no es una cuenta educativa"
fi