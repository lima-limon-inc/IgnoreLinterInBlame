#!/bin/sh
# Lima Limon Abril 2023
# https://github.com/lima-limon-inc/FormateadorJava

archivosSinComitear=$(git status -s | wc -l)
if [ ${archivosSinComitear} -ne 0 ]
then
	echo "Tenes cosas sin comitear"
	echo "Este script esta pensando para ser usado como unico commit"
	echo "Deja todo comiteado y despues podes correr este programa."
	exit 2
fi

# Ejecuto el comando pasado como argumento. Sea lo que sea
eval $1

archivosABorrar=$(git status | grep modified | wc -l)
echo "Formatee ${archivosABorrar} archivos"

seCambioAlgo=$(git diff | wc -l)
if [ ${seCambioAlgo} -eq 0 ]
then
	echo "Nada fue formateado"
	echo "No hago mas"
	exit 2
fi


echo "Hago el commit de los archivos formateos"
git add .
git commit -m "Commit de formateo, nada de codigo cambiando"
hashCommit=$(git rev-parse HEAD)

firmaFormateo="Formateo del codigo"
fechaYFirma+="# "
fechaYFirma+=$(git config user.name)
fechaYFirma+=" | "
fechaYFirma+=$(date)
echo ${fechaYFirma} >> .git-blame-ignore-revs
echo ${hashCommit} >> .git-blame-ignore-revs
echo "" >> .git-blame-ignore-revs


echo "Hago el commit de lo anadido al archivo .git-blame-ignore-revs"
git add .
git commit -m "Anado hash a .git-blame-ignore-revs"
