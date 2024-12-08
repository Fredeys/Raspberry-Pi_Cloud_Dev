#!/bin/bash

# Skript zur Einrichtung des Raspberry Pi

echo "=== Raspberry Pi – Einrichtung ==="

# Schritt 1: Betriebssystem-Installation
echo "1. Installation des Betriebssystems"
echo "Bitte lade den Raspberry Pi Imager von https://www.raspberrypi.com/software/ herunter."
echo "Wähle 'Raspberry Pi OS (64-BIT)', konfiguriere Benutzername, Passwort, Landeseinstellungen und WLAN."
echo "Installiere das Betriebssystem auf der SD-Karte, setze die Karte anschließend in den Raspberry Pi ein."

# Schritt 2: Netzwerkverbindung und SSH-Zugriff
echo "2. Netzwerkverbindung und SSH-Zugriff"

# Überprüfung, ob 'Angry IP Scanner' verfügbar ist
echo "Bitte lade Angry IP Scanner von https://angryip.org herunter, um die IP-Adresse deines Raspberry Pi im Netzwerk zu finden."
echo "Alternativ kannst du auch andere Netzwerkscanner verwenden."

# Hinweis für SSH-Verbindung
echo "Sobald die IP-Adresse bekannt ist, verbinde dich mit dem Raspberry Pi über SSH:"
echo "  ssh Benutzername@IP-Adresse"

# Automatische SSH-Konfiguration
read -p "Möchtest du automatisch versuchen, eine Verbindung mit dem Raspberry Pi herzustellen? (y/n): " connect_ssh
if [ "$connect_ssh" == "y" ]; then
    read -p "Gib den Benutzernamen ein: " username
    read -p "Gib die IP-Adresse des Raspberry Pi ein: " ip_address

    # Verbindung über SSH
    ssh "$username@$ip_address"
else
    echo "Überspringe den automatischen SSH-Verbindungsversuch. Führe manuell den Befehl aus:"
    echo "  ssh Benutzername@IP-Adresse"
fi

# VNC-Server aktivieren
echo "Nach dem SSH-Login konfiguriere den Raspberry Pi:"
echo "  sudo raspi-config"
echo "Folge diesen Anweisungen im Menü:"
echo "  1. Wähle 'Interface Options'."
echo "  2. Wähle 'VNC Enable/disable graphical remote desktop access' und bestätige mit <Yes>."
echo "  3. Bestätige die Meldung 'The VNC Server is enabled' mit <Ok>."
echo "  4. Wähle <Finish>, um zurück ins Terminal zu gelangen."

echo "=== Einrichtung abgeschlossen! ==="

