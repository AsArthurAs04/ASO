#!/bin/bash
# Escribe tipos_etc.sh, que recorre los ficheros de /etc y cuenta cuántos hay de cada tipo según cómo
# termina su nombre:
# Configuración: terminan en .conf
# Copias de seguridad: terminan en .bak o en ~
# Al final, muestra la lista de ficheros .conf y los dos totales.
# $ ./tipos_etc.sh
# Ficheros de configuración:
# /etc/adduser.conf
# /etc/ca-certificates.conf
# ...
# ----
# Configuración: 34
# Copias de seguridad: 1
# Ayuda: for fichero in /etc/*; do ... done


config=0
copias=0

echo "Ficheros de configuración:"

for fichero in /etc/*; do 

    # 3. Si el fichero termina en .conf...
    if [[ $fichero == *.conf ]]; then
        echo $fichero
        
        ((config++))
        

    elif [[ $fichero == *.bak || $fichero == *~ ]]; then
        ((copias++))
        
    fi

done

echo "Configuración: $config"
echo "Copias de seguridad: $copias"