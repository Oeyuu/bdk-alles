#!/bin/bash

# Überprüfen, ob das gewünschte Argument übergeben wurde
if [ $# -ne 1 ]; then
    echo "Bitte geben Sie den Release-Typ als Argument an (major, minor oder bugfix)."
    exit 1
fi

RELEASE_TYPE="$1"

# Gehe in den modules-Ordner
cd "$(dirname "$0")"

# Durchsuche alle Unterordner im aktuellen Verzeichnis (modules)
for module_folder in */; do
    # Überprüfe, ob die Datei "release.sh" im Unterordner existiert
    if [ -f "$module_folder/release.sh" ]; then
        echo "Führe release.sh in $module_folder mit dem Argument '$RELEASE_TYPE' aus..."
        # Ausführen von release.sh im Unterordner mit dem übergebenen Argument
        (cd "$module_folder" && ./release.sh "$RELEASE_TYPE")
        echo "Fertig mit $module_folder."
    else
        echo "Keine release.sh in $module_folder gefunden."
    fi
done