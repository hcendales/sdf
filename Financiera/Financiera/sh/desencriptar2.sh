#!/bin/sh
cd /
cd trfavvillas
# parametros 
proceso=desencriptar2.sh
ruta=/trfavvillas
archivoLog=$ruta/$proceso.log
echo "PASO 00: Inicio $proceso" 1>$archivoLog
echo "PASO 01: Configura shell" 1>>$archivoLog
echo "Parametro: $1"  1>>$archivoLog
fechaAct=$(/bin/date)
echo "Usuario proceso: [$USER]" 1>>$archivoLog
echo "Fecha proceso: $fechaAct " 1>>$archivoLog
echo " " 1>>$archivoLog
echo "inicio: $fechaLog" 1>>$archivoLog
echo "PASO 03: Desencripta archivos Recibidos AV Villas" 1>>$archivoLog
echo "PASO 05: Lista directorio" 1>>$archivoLog
ls -l >>$archivoLog
echo "PASO 07: Va a eejcutar desencriptar" 1>>$archivoLog
/usr/bin/gpg --passphrase-fd 0 --batch --decrypt-files $1 <frase.txt >>$archivoLog
rc=$?
if [ $rc -gt 0 ]
then 
	echo "Problemas en Desencripcion $1 $rc " 1>>$archivoLog
else
	echo "Desencripcion correcta $1" 1>>$archivoLog
fi
echo "PASO 99: Desencripta correcta" 1>>$archivoLog