#!/bin/bash

DIR=$(pwd)
SALIDA="$DIR/Filtro_Avanzado.txt"

IP=$(curl -s ifconfig.me)
USUARIO=$(whoami)
HASH=$(echo -n "$USUARIO" | md5sum | awk '{print $1}')
REPO=$(git remote get-url origin)

echo "Mi IP publica es: $IP" > "$SALIDA"
echo "Mi usuario es: $USUARIO" >> "$SALIDA"
echo "El hash de mi usuario es: $HASH" >> "$SALIDA"
echo "La url de mi repositorio es: $REPO" >> "$SALIDA"
