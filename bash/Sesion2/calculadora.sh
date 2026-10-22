#!/bin/bash

 read -p "Primer Numero:  " num1
 read -p "Segundo Numero:  " num2
suma(){
 echo $(($1 + $2))
}

restar(){
 echo $(($1 - $2))
}
multiplicar(){
 echo $(($1 * $2))
}
dividir(){  
 if [[ $2 -eq 0 ]]; then 
     echo "Error:division por cero"
 else 
     echo "scale=2; $1 /$2" |bc
 fi
}


echo "*********************"
echo "*MENU DE CALCULADORA*"
echo "* Esbribe la opcion *"
echo "*) suma             *"
echo "*) resta            *"
echo "*) multiplicar      *"
echo "*) dividir          *"
echo "*********************"
read -p "Escoge una opcion:  " opcion

case $opcion in
   
    suma)
     
     echo "El resultado de la suma es: $(suma $num1 $num2)"
     
    
    ;;
    resta)
     echo "El resultado de la resta es; $(restar $num1 $num2)"  
    ;;

    multiplicar)
     echo "El resultado de la multiplicacion es; $(multiplicar $num1 $num2)"    
    ;;
    
    dividir)
     echo "El resultado de la division es; $(dividir $num1 $num2)"    
    ;;

    
    *)
        echo "Parametro no reconocido"
    ;;
esac