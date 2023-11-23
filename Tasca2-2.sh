#!/bin/bash
document=$1
ordenarvaloracio(){
sort -n -r -t , -k 4 $document | uniq > year_llista.txt
}
mostrar_pelis(){
lin=$(wc -l < year_llista.txt)
for i in $(seq 1 $(($lin-1)))
do
if [ $i -le $lin ]
then
echo cargando
clear
else
echo listo
fi
title=$(head -$i year_llista.txt| tail -1| cut -d, -f1)
rating=$(head -$i year_llista.txt| tail -1| cut -d, -f5)
year=$(head -$i year_llista.txt| tail -1| cut -d, -f4)
desc=$(head -$i year_llista.txt| tail -1| cut -d, -f3)
clas=$(head -$i year_llista.txt| tail -1| cut -d, -f2)
size=$(head -$i year_llista.txt| tail -1| cut -d, -f6)
echo "*****************************************************************************************************************************" >> year_output.txt
echo "*Títol:	"$title	>> year_output.txt
echo "*Any: "$year"	*Nivell de classificació:	"$clas 	>> year_output.txt
echo "*Descripció:	"$desc 	>> year_output.txt
echo "*Valoració dels usuaris: "$rating"	*Mida de la mostra:	"$size 	>> year_output.txt
done
}

echo "************************   HBBQO: Las peliculas segun el año y la cadena que ha pa:   ************************************" > year_output.txt
ordenarvaloracio
more year_output.txt
