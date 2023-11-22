#!/bin/bash
document=$1
fc=$2
sc=$3
ordenarvaloracio(){
sort -t , -k 1 $document | uniq > title_llista.txt
lin=$(wc -l < title_llista.txt)
for i in $(seq 1 $(($lin-1)))
do
if [ $i -le $lin ]
then
echo cargando
clear
else
echo listo
fi
title=$(head -$i title_llista.txt| tail -1| cut -d, -f1)
rating=$(head -$i title_llista.txt| tail -1| cut -d, -f5)
year=$(head -$i title_llista.txt| tail -1| cut -d, -f4)
desc=$(head -$i title_llista.txt| tail -1| cut -d, -f3)
clas=$(head -$i title_llista.txt| tail -1| cut -d, -f2)
size=$(head -$i title_llista.txt| tail -1| cut -d, -f6)
echo "*****************************************************************************************************************************" >> title_output.txt
echo "*Títol:	"$title	>> title_output.txt
echo "*Any: "$year"	*Nivell de classificació:	"$clas 	>> title_output.txt
echo "*Descripció:	"$desc 	>> title_output.txt
echo "*Valoració dels usuaris: "$rating"	*Mida de la mostra:	"$size 	>> title_output.txt
done

}
echo "************************   HBBQO: El Nostre catàleg de ratings segons els usuaris  es:   ************************************" > title_output.txt
ordenartitol
more title_output.txt
