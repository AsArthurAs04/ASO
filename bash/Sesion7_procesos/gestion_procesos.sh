#!/bin/bash

listar_usuario(){
    read -p " introduce el nombre del usuario " usuario
    if id "$usuario" &> /dev/null; then 
        echo "Procesos del usuario $usuario:"
        ps -u "$usuario"
    else
        echo "Error el usuario "$usuario" no existe"
    fi
}

buscar_proceso(){
    read -p " introduce el nombre del proceso:  " proceso
    resultados=$(ps -eo pid,user,%cpu,comm | grep -i "$proceso")
    
    if [[ -n "$resultados" ]];then
        ps -eo pid,user,%cpu,comm | head -n 1
        echo "$resultados"
    else
        echo "No hay ningun proceso con ese nombre"
    fi
}

top_cpu(){
    read -p "Introduce los procesos que quieras mostrar: " n
    n=${n:-5}
    echo "Los procesos que mas consumen son:"
    ps aux --sort=-%cpu | head -n $((n + 1))
}

cambiar_prioridad(){
    read -p "Introduce el PiD del proceso:" pid
    if valida_pid "$pid"; then
        echo "El proceso existe"
    else
        echo "Error el proceso no existe"
    fi
}

finalizar_proceso(){
read -p "Introcude el PiD del proceso" pid
    if valida_pid "$pid"; then
        echo "El proceso existe"
    else
        echo "Error el proceso no existe"
    fi

}

valida_pid(){
    local pid="$1"
    if [[ "$pid" =~ ^[0-9]+$ ]] && ps -p "$pid" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

while true; do
    echo "======== GESTIÓN DE PROCESOS ========";
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Mostrar los N procesos que más CPU consumen"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"
    read -p "Opción: " opcion


    case $opcion in
        1) listar_usuario ;;
        2) buscar_proceso ;;
        3) top_cpu ;;
        4) cambiar_prioridad ;;
        5) finalizar_proceso ;;
        6) echo "adios" ; exit 0 ;;
        *) echo "Opcion no valida" ;;
    esac
    
    echo  ""
done
    