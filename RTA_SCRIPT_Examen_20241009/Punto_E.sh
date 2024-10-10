#! /bin/bash

DIR=$(pwd)

SALIDA="$DIR/Filtro_Basico.txt"

grep MemTotal /proc/meminfo > "$SALIDA"

sudo dmidecode -t chassis | grep "Manufacturer" >> "$SALIDA"
