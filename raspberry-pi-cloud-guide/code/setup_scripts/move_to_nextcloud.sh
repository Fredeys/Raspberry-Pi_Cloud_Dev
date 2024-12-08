#!/bin/bash

# Skript zum Verschieben der Titanic-CSV-Datei in Nextcloud

echo "=== Titanic-Dataset in Nextcloud speichern ==="

# Pfade
CSV_SOURCE="/home/pi/titanic.csv"
NEXTCLOUD_TARGET="/var/www/html/nextcloud/titanic.csv"

# Datei verschieben
if [ -f "$CSV_SOURCE" ]; then
    sudo mv "$CSV_SOURCE" "$NEXTCLOUD_TARGET"
    sudo chown www-data:www-data "$NEXTCLOUD_TARGET"
    sudo chmod 644 "$NEXTCLOUD_TARGET"
    echo "Titanic-Dataset wurde erfolgreich in Nextcloud gespeichert."
else
    echo "Fehler: Titanic-CSV-Datei nicht gefunden!"
fi

echo "=== Vorgang abgeschlossen ==="

