#!/bin/bash

# Configurar tu nombre y correo en Git (si no lo has hecho)
git config user.name "TuNombre"
git config user.email "TuCorreo@example.com"

# Definir la cantidad de días que quieres llenar
DAYS=30  # Puedes cambiar este número

# Crear o asegurarse de que la carpeta "commit_booster" existe
mkdir -p commit_booster
cd commit_booster

# Crear un archivo de registro de commits
touch commits.log

# Iterar sobre los últimos N días y hacer commits falsos
for i in $(seq 0 $DAYS); do
    DATE=$(date --date="$i days ago" +%Y-%m-%d)
    
    echo "Commit generado el $DATE" >> commits.log
    git add commits.log
    GIT_AUTHOR_DATE="$DATE 12:00:00" GIT_COMMITTER_DATE="$DATE 12:00:00" git commit -m "Commit automático para $DATE"
done

# Subir los commits a GitHub
git push origin main

echo "¡Hecho! Tu historial de commits se ha actualizado."
