#!/bin/bash
document=$1
ordenarvaloracio(){
sort -n -r -t , -k 5 $document | uniq > rating_llista.txt
lin=$(wc -l < rating_llista.txt)
for i in $(seq 1 $(($lin-1)))
do
if [ $i -le $lin ]
then
echo cargando
clear
else
echo listo
fi
title=$(head -$i rating_llista.txt| tail -1| cut -d, -f1)
rating=$(head -$i rating_llista.txt| tail -1| cut -d, -f5)
year=$(head -$i rating_llista.txt| tail -1| cut -d, -f4)
desc=$(head -$i rating_llista.txt| tail -1| cut -d, -f3)
clas=$(head -$i rating_llista.txt| tail -1| cut -d, -f2)
size=$(head -$i rating_llista.txt| tail -1| cut -d, -f6)
echo "*****************************************************************************************************************************" >> rating_output.txt
echo "*Títol:	"$title	>> rating_output.txt
echo "*Any: "$year"	*Nivell de classificació:	"$clas 	>> rating_output.txt
echo "*Descripció:	"$desc 	>> rating_output.txt
echo "*Valoració dels usuaris: "$rating"	*Mida de la mostra:	"$size 	>> rating_output.txt
done

}
echo "************************   HBBQO: El Nostre catàleg de ratings segons els usuaris  es:   ************************************" > rating_output.txt
ordenarvaloracio
more rating_output.txt
