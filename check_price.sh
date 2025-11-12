#!/bin/bash

API_URL="https://cointrademonitor.com/api/pbb/v1/ticker"

LIMITE_PRECO="3000000.00"

echo "Verificando API: $API_URL"
echo "Limite de alerta definido em: R$ $LIMITE_PRECO"

PRECO_ATUAL=$(curl -s $API_URL | jq -r '.last')

if ! [[ "PRECO_ATUAL" =~ ^[0-9.]+$ ]]; then
	echo "FALA AO OBTER PREÇO"
	echo "Resposta recebida: $PRECO_ATUAL"
	exit 1
fi

echo "Preço atual do BITCOIN: R$ $PRECO_ATUAL"

if ((   $(echo "$PRECO_ATUAL < $LIMITE_PRECO" | bc -l )   )); then
	echo "ALERTA! o preço (R$ $PRECO_ATUAL) esta abaixo do limite (R$ $LIMITE_PRECO)"
	exit 1
else
	echo "Tudo OK. Preço (R$ $PRECO_ATUAL) está acima do limite"
	exit 0
fi
