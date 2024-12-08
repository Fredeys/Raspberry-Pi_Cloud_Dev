#!/bin/bash

# Skript zur Installation des Apache-Webservers und der benötigten PHP-Pakete

echo "=== Cloud-Setup: Installation des Webservers ==="

# Update der Paketliste
echo "1. Aktualisiere die Paketliste..."
sudo apt update

# Installation des Apache-Webservers
echo "2. Installiere Apache-Webserver..."
sudo apt install apache2 -y

# Installation der PHP-Pakete
echo "3. Installiere PHP und zusätzliche Pakete..."
sudo apt install php php-gd php-curl php-zip php-xml php-mysql -y

# Überprüfung des Apache-Status
echo "4. Überprüfe, ob Apache erfolgreich installiert und gestartet wurde:"
sudo systemctl status apache2 | grep "active (running)" && echo "Apache läuft erfolgreich." || echo "Apache läuft nicht. Bitte überprüfe die Installation."

echo "=== Webserver-Installation abgeschlossen! ==="

