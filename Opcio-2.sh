#!/bin/bash
document=$1
mostrarMenu(){
echo ------------------------------------------
echo 2 - Cerca d"'"una pel·lícula al catàleg.
echo ------------------------------------------
echo 2-1 Cercar pel·lícules per inici del títol.
echo 2-2 Cercar pel·licules per titol i any.
echo 2-3 Cercar pel·licules per ratinglevel i títol.
echo 0. Tornar al menu anterior.
echo Introduce la opción:
}
tasca2-1(){
echo Primera lletra
read a
echo Segona lletra
read b
echo se enviara $a i $b
}
tasca2-2(){
echo Introdueix cadena
read cadena
echo Introdueix any
echo any
echo se enviara $cadena i $any
}

tasca2-3(){
lin=$(wc -l < $document)
for i in $(seq 1 $(($lin-1)))
do
clas=$(head -$i $document| tail -1| cut -d, -f2)
if [ $(($clas != rat* )) ]
echo $clas >> ratinglevel.txt
done
sort ratinglevel.txt | uniq > sorted_rl.tt
cat sorted_rl.txt
echo escoge un rating de la lista
read rl
echo Escribe una cadena
read cad
echo Se enviara $rl y $cad
}


mostrarMenu
read op
case $op in
1) tasca2-1
;;
2) tasca2-2 
;;
3) tasca2-3
;;
esac
