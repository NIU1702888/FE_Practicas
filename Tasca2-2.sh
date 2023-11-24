#!/bin/bash
document=$1
cadena=$2
fy=$3
ordenarvaloracio(){
	sort -n -r -t , -k 1 $document | uniq | cut -d, -f1|  grep -i -F $cadena > llistat_titols_pelis.txt
	}
comprobar_pelis(){
	sort -n -r -t , -k 1 $document | uniq > year_llista.txt
	lin=$(wc -l < year_llista.txt)
	lin2=$(wc -l < llistat_titols_pelis.txt)
	for i in $(seq 1 $(($lin2)))
		do
			comp_tit=$(head -$i llistat_titols_pelis.txt| tail -1)
			for j in $(seq 1 $(($lin)))
				do
					if [ $i -le $lin ]
					then
					echo cargando $i/$lin2 -  $j/$lin
					clear
					else
					echo listo
					fi
				tit=$(head -$j year_llista.txt| tail -1| cut -d, -f1)
					if [ "$comp_tit" == "$tit" ]
						then
						head -$j year_llista.txt| tail -1 | grep -F $fy |uniq >> tituls_any.txt
						#sort -n -r -t , -k 1 tituls_any.txt | uniq > tituls_any.txt						
					fi
				done
		done
}
mostrar_pelis(){
	lin3=$(wc -l < tituls_any.txt)
	for i in $(seq 1 $(($lin3)))
		do
		title=$(head -$j tituls_any.txt| tail -1| cut -d, -f1)
						rating=$(head -$j tituls_any.txt| tail -1| cut -d, -f5)
						year=$(head -$j tituls_any.txt| tail -1| cut -d, -f4)
						desc=$(head -$j tituls_any.txt| tail -1| cut -d, -f3)
						clas=$(head -$j tituls_any.txt| tail -1| cut -d, -f2)
						size=$(head -$j tituls_any.txt| tail -1| cut -d, -f6)
						echo "*****************************************************************************************************************************" >> year_output.txt
						echo "*Títol:	"$title	>> year_output.txt
						echo "*Any: "$year"	*Nivell de classificació:	"$clas 	>> year_output.txt
						echo "*Descripció:	"$desc 	>> year_output.txt
						echo "*Valoració dels usuaris: "$rating"	*Mida de la mostra:	"$size 	>> year_output.txt

		done
}
echo "************************   HBBQO: Las peliculas segun el año y la cadena que ha pa:   ************************************" > year_output.txt
rm tituls_any.txt
ordenarvaloracio
comprobar_pelis
mostrar_pelis
more year_output.txt
