#Scripting
#Se deberá generar un script llamado scripting-tp-integrador.sh el cual mostrará un menu que tendra las siguientes funcionalidades (Se puede tomar como ejemplo el ej8 de scripting):
#1-Pedir un numero entero y mostrar esa cantidad de elementos de la sucesion de Fibonacci.
#2-Pedir un numero entero y mostrar por pantalla ese numero en forma invertida.
#3-Pedir una cadena de caracteres y evaluar si es palindromo o no.
#4-Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene.
#5-Pedir el ingreso de 5 numeros enteros y mostrarlos por pantalla en forma ordenada.
#6-Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene (No se tenga en cuenta ./ y ../).
#7-Salir (Saludando al usuario que ejecuto el programa).

#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Sucesion Fibonacci"
    echo "2) Numero en forma inversa"
    echo "3) Cadena palindromo"
    echo "4) Cantidad de lineas de un archivo"
	echo "5) Numeros en forma ordenada"
	echo "6) Tipos de archivo"
    echo "7) Salir"
    echo "-------------------------------------------------------------"
}

function salir_saludando(){
    NOMBRE=$1
    echo "Chau $NOMBRE"
    sleep 2
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu
while true; do
    read -p "Ingrese una opcion: " OPCION
    case $OPCION in
        1)  read -p "Escribir un numero: " cant
			a=0
			b=1

			if [ $cant -ge 1 ]; then
				for ((i=0; i<cant; i++)) ; do
					echo -n "$a "
					fn=$((a + b))
					a=$b
					b=$fn
				done
				echo
			else
				echo "No se puede mostrar la serie del numero ingresado"
			fi;;

        2)  read -p "Ingrese un numero: " numero
			echo $numero | rev;;

        3)  echo "Ingrese una cadena de caracteres: "
			read str
			for i in $(seq 0 ${#str}) ; do
				revstr=${str:$i:1}$revstr
			done
			if [ "$str" = "$revstr" ]; then
				echo "Es palindromo"
			else
				echo "No es palindromo"
			fi;;

        4)  read -p "Ingrese el path del archivo: " FILE
            CANT=`wc -l $FILE | cut -d ' ' -f 1`
			echo "La cantidad de lineas del archivo es $CANT";;
		
		5)  read -p "Ingrese numero 1: " n1
			read -p "Ingrese numero 2: " n2
			read -p "Ingrese numero 3: " n3
			read -p "Ingrese numero 4: " n4
			read -p "Ingrese numero 5: " n5
			echo -e "$n1\n$n2\n$n3\n$n4\n$n5" | sort -n;;
		
        6)  read -p "Ingrese el path del directorio: " PATH
            find $PATH -type f -not -path "*/\.*" | sed -n 's/..*\.//p' | sort | uniq -c;;

        7)  salir_saludando `whoami`
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0