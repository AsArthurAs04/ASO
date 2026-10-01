#!/bin/bash
# Escribe usuarios_bash.sh, que lee /etc/passwd línea a línea y muestra el nombre de los usuarios
# cuya línea termina en bash. Al final, muestra cuántos hay.
# $ ./usuarios_bash.sh
# root
# alumno
# ----
# Usuarios con bash: 2
# Ayuda:
# while read -r linea; do ... done < /etc/passwd
# El nombre del usuario es lo que hay antes del primer :. Puedes sacarlo con ${linea%%:*}.


usuarios=0

while read -r linea; do

    if [[ $linea == *bash ]]; then
        
        echo ${linea%%:*}

        ((usuarios++))
    fi

done < /etc/passwd


echo "Usuarios con bash: $usuarios"

