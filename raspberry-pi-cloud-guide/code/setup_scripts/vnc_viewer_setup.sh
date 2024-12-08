#!/bin/bash

# Skript zur Einrichtung des VNC-Viewers für den Raspberry Pi

echo "=== VNC-Viewer Einrichtung ==="

# Download-URL für den VNC-Viewer
DOWNLOAD_URL="https://www.realvnc.com/de/connect/download/viewer/macos/?lai_vid=WKMJdXxyOHBkz&lai_sr=0-4&lai_sl=l&lai_p=1"

# Schritt 1: Download und Installation des VNC-Viewers
echo "1. Download und Installation des VNC-Viewers"
echo "Bitte lade den VNC-Viewer von folgender URL herunter:"
echo "$DOWNLOAD_URL"
echo "Installiere die Applikation gemäß den Anweisungen auf der Website."

# Schritt 2: Verbindung zum Raspberry Pi herstellen
echo "2. Verbindung zum Raspberry Pi herstellen"
echo "Öffne den VNC-Viewer und erstelle eine neue Verbindung:"
echo "  - Verwende die zuvor ermittelte IP-Adresse des Raspberry Pi als 'VNC-Server'."
echo "  - Vergib einen Namen für die Verbindung, um sie leichter zu identifizieren."

# Schritt 3: Authentifizierung und Zugriff
echo "3. Authentifizierung und Zugriff"
echo "Beim ersten Verbindungsaufbau erscheint eine Warnung ('Identity Check')."
echo "Bestätige diese Meldung durch Klicken auf 'Continue'."
echo "Gib anschließend die folgenden Zugangsdaten ein:"
read -p "Benutzername: " username
read -sp "Passwort: " password
echo ""
echo "Diese Zugangsdaten werden für die Authentifizierung im VNC-Viewer verwendet."

# Schritt 4: Graphischer Zugriff auf den Raspberry Pi
echo "4. Graphischer Zugriff auf den Raspberry Pi"
echo "Um den VNC-Server auf dem Raspberry Pi zu starten, führe folgenden Befehl im Raspberry Terminal aus:"
echo "  vncserver-x11"
echo "Nach der erfolgreichen Authentifizierung erhältst du Zugriff auf die graphische Oberfläche des Raspberry Pi."

# Zusätzlicher Hinweis
echo "Zusätzlicher Hinweis:"
echo "Wenn du einen VNC-Account erstellst und mit dem VNC-Viewer verknüpfst, ist der Zugriff auf den Raspberry Pi auch ortsunabhängig möglich."

echo "=== VNC-Viewer Einrichtung abgeschlossen! ==="

