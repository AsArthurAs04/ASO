#!/bin/bash
# Escribe config_limpia.sh, que recibe un fichero de configuración y lo muestra sin comentarios ni
# líneas vacías, usando un solo sed.
# Si no recibe ningún parámetro, muestra un mensaje de uso y termina.
# Si el fichero no existe, muestra un error y termina
#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Pasa un fichero de configuración"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: El fichero '$1' no existe."
    exit 1
fi

sed '/^\s*#/d; /^\s*$/d' "$1"