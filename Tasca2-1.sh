#!/bin/bash
document=$1
fc=$2
sc=$3
echo  $2
echo  $3
rm nova_llista.txt
ordenartitol(){
sort -t , -k 1 $document | uniq | grep -i ^[$fc-$sc] > nova_llista.txt
#for i in {$(($2))..$(($3))}
#do
#echo $i
#grep -i ^$i title_llista.txt >> nova_llista.txt
#done
}
mostrar_pelis(){
lin=$(wc -l < nova_llista.txt)
for i in $(seq 1 $(($lin-1)))
do
title=$(head -$i nova_llista.txt| tail -1| cut -d, -f1)
rating=$(head -$i nova_llista.txt| tail -1| cut -d, -f5)
year=$(head -$i nova_llista.txt| tail -1| cut -d, -f4)
desc=$(head -$i nova_llista.txt| tail -1| cut -d, -f3)
clas=$(head -$i nova_llista.txt| tail -1| cut -d, -f2)
size=$(head -$i nova_llista.txt| tail -1| cut -d, -f6)
echo "*****************************************************************************************************************************" >> pelis_output.txt
echo "*Títol:	"$title	>> pelis_output.txt
echo "*Any: "$year"	*Nivell de classificació:	"$clas 	>> pelis_output.txt
echo "*Descripció:	"$desc 	>> pelis_output.txt
echo "*Valoració dels usuaris: "$rating"	*Mida de la mostra:	"$size 	>> pelis_output.txt
done

}
echo "************************   HBBQO: LLista de plicules del catáleg que comencen desde la " $fc " a la " $sc ":   ************************************" > pelis_output.txt
clear
ordenartitol
mostrar_pelis
more pelis_output.txt
