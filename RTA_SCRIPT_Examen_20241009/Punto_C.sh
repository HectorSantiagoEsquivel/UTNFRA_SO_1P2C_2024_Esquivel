#!/bin/bash


HASH=$(echo -n "$(whoami)" | md5sum | awk '{print $1}')


sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores


sudo useradd -m -g p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A1
sudo useradd -m -g p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A2
sudo useradd -m -g p1c2_2024_gAlumno -p "$HASH" p1c2_2024_A3
sudo useradd -m -g p1c2_2024_gProfesores -p "$HASH" p1c2_2024_P1
sudo chown p1c2_2024_A1:p1c2_2024_A1 ~/Examenes-UTN/alumno_1
sudo chmod 750 ~/Examenes-UTN/alumno_1


sudo chown p1c2_2024_A2:p1c2_2024_A2 ~/Examenes-UTN/alumno_2
sudo chmod 700 ~/Examenes-UTN/alumno_2


sudo chown p1c2_2024_A3:p1c2_2024_A3 ~/Examenes-UTN/alumno_3
sudo chmod 775 ~/Examenes-UTN/alumno_3


sudo chown p1c2_2024_P1:p1c2_2024_gProfesores ~/Examenes-UTN/profesores
sudo chmod 770 ~/Examenes-UTN/profesores


for (( i=1; i<=3; i++ )); do
  sudo -u p1c2_2024_A${i} bash -c "whoami > ~/Examenes-UTN/alumno_${i}/validar.txt"
done

sudo -u p1c2_2024_P1 bash -c "whoami > ~/Examenes-UTN/profesores/validar.txt"
