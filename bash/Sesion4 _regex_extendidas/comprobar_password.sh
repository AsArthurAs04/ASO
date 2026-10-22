#!/bin/bash
diccionario=/usr/share/dict/spanish
re_longitud='^.{12,}$'
re_digito='[0-9]'
re_mayuscula='[A-Z]'
re_simbolo='[^a-zA-Z0-9]'
segura=1
if [[ $# -eq 0 ]]; then
echo "Uso: $0 contraseña"
exit 1
fi
if [[ ! -f $diccionario ]]; then
echo "Error: no se encuentra el diccionario $diccionario"
exit 1
fi
if [[ $1 =~ $re_longitud ]]; then
echo " Tiene al menos 12 caracteres: sí"
else
echo " Tiene al menos 12 caracteres: no"
segura=0
fi
if [[ $1 =~ $re_digito ]]; then
echo " Contiene algún dígito: sí"
else
echo " Contiene algún dígito: no"
segura=0
fi
if [[ $1 =~ $re_mayuscula ]]; then
echo " Contiene alguna mayúscula: sí"
else
echo " Contiene alguna mayúscula: no"
segura=0
fi
if [[ $1 =~ $re_simbolo ]]; then
echo " Contiene algún símbolo: sí"
Página 2 de 3
else
echo " Contiene algún símbolo: no"
segura=0
fi
if grep -qxi -- "$1" $diccionario; then
echo " No es una palabra del diccionario: no"
segura=0
else
echo " No es una palabra del diccionario: sí"
fi
if [[ $segura -eq 1 ]]; then
echo "La contraseña es segura"
else
echo "La contraseña no es segura"
fi