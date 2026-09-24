# #Actividad 1. bytes_a_gb.sh
# #Repasa: Funciones + Matemáticas (bc)
# Escribe una función bytes_a_gb que reciba un número de bytes (por ejemplo, el tamaño que devuelve du o df)
# y devuelva (con echo) su equivalente en GB, con 2 decimales de precisión. 1 GB = 1073741824 bytes.
# Pista
# echo "scale=2; $bytes / 1073741824" | bc — scale=2 fija dos decimales de precisión.
# Lista de verificación:
# • bytes_a_gb 5000000000 → 4.65
# • bytes_a_gb 1073741824 → 1.00
#!/bin/bash

bytes_a_gb() {
    local bytes=$1

    if [ -z "$bytes" ]; then    
        echo "Uso: bytes_a_gb <bytes>"
        return 1
    fi
     echo "scale=2; $bytes / 1073741824" | bc
} 

bytes_a_gb 5000000000
bytes_a_gb 1073741824

