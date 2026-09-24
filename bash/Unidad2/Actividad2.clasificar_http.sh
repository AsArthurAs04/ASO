# Escribe una función clasificar_http que reciba un código de estado HTTP (como los que aparecen en los logs
# de un servidor web) y devuelva (con echo): "Éxito" (200-299), "Redirección" (300-399), "Error del cliente"
# (400-499), "Error del servidor" (500-599). Prueba la función con varios códigos.
# Lista de verificación:
# • clasificar_http 200 → Éxito
# • clasificar_http 301 → Redirección
# • clasificar_http 404 → Error del cliente
# • clasificar_http 500 → Error del servidor
# • Usa elif para encadenar los cuatro tramos, con [[ ]].


clasificar_http(){

    if [ -z $1 ]; then
        echo "Pase un parametro valido"
    
    elif [[ $1 -ge 200 && $1 -le 299 ]]; then
        echo "Éxito"
    elif [[ $1 -ge 300 && $1 -le 399 ]]; then
        echo "Redireccion"
    elif [[ $1 -ge 400 && $1 -le 499 ]]; then
        echo "Error de cliente"
    elif [[ $1 -ge 500 && $1 -le 599 ]]; then 
        echo "Error del servidor"
    fi
}       

# clasificar_http 200
# clasificar_http 301
# clasificar_http 404 
# clasificar_http 500

clasificar_http $1