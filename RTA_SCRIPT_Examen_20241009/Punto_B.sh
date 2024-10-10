#! /bin/bash

DISCO="/dev/sdd"

PESO_TOTAL=$(lsblk -b -d -o SIZE -n $DISCO)
PESO_TOTAL_CONVERTIDO=$(( PESO_TOTAL / 512 ))
PESO_PARTICION=$(( PESO_TOTAL_CONVERTIDO / 12 ))
echo ${PESO_PARTICION}

sudo fdisk "$DISCO" << EOF
n       
e       


  
w       
EOF



for (( i=5; i<=15; i++ ))
do
    
    sudo fdisk "$DISCO" << EOF
n

+${PESO_PARTICION}
w
EOF

    echo "EXITO AL PARTICIONAR $i "
done

echo
echo


for (( i=5; i<=15; i++ ))
do
    PARTICION="${DISCO}${i}"
    mkfs.ext4 $PARTICION

    echo "EXITO AL FORMATEAR $i"
done

echo
echo

CONTADORDISCO=5

for (( i=1; i<=3; i++ )); do
    
    for (( j=1; j<=3; j++ )); do
        
        echo "${DISCO}${CONTADORDISCO}  /home/Examenes-UTN/alumno_${i}/parcial_${j}   ext4  defaults  0 0" | sudo tee -a /etc/fstab
        CONTADORDISCO=$((CONTADORDISCO + 1))  
    done
done
echo "${DISCO}${CONTADORDISCO}  /home/Examenes-UTN/profesores  ext4  defaults  0 0" | sudo tee -a /etc/fstab

mount -a

