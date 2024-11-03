#!/bin/bash

programaNom=''
programaExec=''
comprobarPrograma(){
	comprobar=$(which $programaExec)
	
	if [ $comprobar ]; then
		echo "$programaNom		----> Instalado en $comprobar"
	else
		echo "Se necesita instalar $programaNom"
		sudo apt install $programaNom
	fi
}

#----------------- Nitrogen ------------------
programaNom=nitrogen
programaExec=nitrogen
comprobarPrograma

#----------------- wmname ------------------
programaNom=wmname
programaExec=wmname
comprobarPrograma
