#!/bin/bash

DIR=$(pwd)
SALIDA="$DIR/Filtro_Avanzado.txt"


# Obtener la IP pública
IP=$(curl -s ifconfig.me)

# Obtener el nombre del usuario actual
USUARIO=$(whoami)

# Obtener el hash del usuario (usamos el comando id con hash simplificado)
HASH=$(echo -n "$USUARIO" | md5sum | awk '{print $1}')

# Obtener la URL del repositorio remoto
REPO=$(git remote get-url origin)

# Escribir en el archivo con el formato deseado
echo "Mi IP publica es: $IP" > "$SALIDA"
echo "Mi usuario es: $USUARIO" >> "$SALIDA"
echo "El hash de mi usuario es: $HASH" >> "$SALIDA"
echo "La url de mi repositorio es: $REPO" >> "$SALIDA"
