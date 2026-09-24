# Escribe una función pedir_puerto_valido que pida repetidamente un puerto TCP (con read -p) hasta que el
# usuario introduzca un número entre 1 y 65535, y entonces termine. Llama a la función y, cuando acabe,
# muestra el puerto recibido.
# Pista
# [[ $puerto =~ ^[0-9]+$ ]] comprueba que la cadena son solo dígitos; (( puerto >= 1 && puerto <= 65535 ))
# comprueba que está en rango.
# Si no declaras puerto con local dentro de la función, sigue disponible fuera de ella al terminar — no hace falta
# devolverlo con echo.

pedir_puerto_valido(){
 while true; do
 read -p "Introduce un puerto TCP" $puerto
  if [[ $puerto -ge 1 && $puerto -le 65535   ]]; then
  break
  fi
}

 
