#!/bin/bash
# Escribe pedir_login.sh, que pide un nombre de usuario con read y lo vuelve a pedir hasta que sea
# válido. Un login es válido si:
# Empieza por una letra minúscula.
# Después solo tiene letras minúsculas o dígitos.
# Cuando sea válido, comprueba si ya existe en el sistema. Si no existe, muestra la orden para crearlo
# (sin ejecutarla).
# $ ./pedir_login.sh
# Nombre de usuario: 1alumno
# No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos.
# Nombre de usuario: Alumno
# No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos.
# Nombre de usuario: root
# El usuario root ya existe.
# $ ./pedir_login.sh
# Nombre de usuario: alumno07
# Para crearlo: sudo useradd -m -s /bin/bash alumno07
# Ayuda: para saber si existe, puedes usar grep -q "^$login:" /etc/passwd.

while true; do
read -p "Escribe un nombre de usuario que cumpla los parametros; " nombre


 if ! [[ $nombre =~ ^[a-z][a-z0-9]*$ ]]; then
    echo "No es valido. Debe empezar por minuscula y tener solo minusclas o digitos"
else
 break
 fi 

done

if grep -q "^$nombre:" /etc/passwd; then
    echo "El usuario $nombre ya existe."
else
    echo "Para crearlo: sudo useradd -m -s /bin/bash $nombre"
fi
