#!/bin/bash


SITE_URL="https://www.google.com/"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SITE_URL)

if [ $STATUS_CODE -eq 200 ]; then
	echo "Sucesso: O site $SITE_URL está ONLINE (Status: $STATUS_CODE)"
else
	echo "Falha: O site $SITE_URL está OFFLINE (Status: $STATUS_CODE)"
	
	#Diga ao Shell (Nuvem) que falhou.
	exit 1
fi