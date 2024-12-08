#!/bin/bash

# Skript zur Einrichtung der MariaDB-Datenbank für Nextcloud

echo "=== Einrichtung der MariaDB-Datenbank ==="

# Schritt 1: Installation von MariaDB
echo "1. Installation von MariaDB..."
sudo apt update
sudo apt install mariadb-server -y

# Schritt 2: Grundkonfiguration von MariaDB
echo "2. Grundkonfiguration von MariaDB..."
echo "Der folgende Schritt führt die Sicherheitskonfiguration durch."
sudo mysql_secure_installation

# Schritt 3: Einrichtung der Datenbank
echo "3. Einrichtung einer neuen Datenbank für Nextcloud..."
read -p "Bitte gib den Benutzernamen für die neue Datenbank ein (z. B. 'nextclouduser'): " db_user
read -p "Bitte gib das Passwort für den Benutzer '$db_user' ein: " db_password
read -p "Bitte gib den Namen der neuen Datenbank ein (z. B. 'nextcloud'): " db_name

# MariaDB-Befehle ausführen
sudo mysql -u root <<EOF
CREATE DATABASE $db_name;
GRANT ALL ON $db_name.* TO '$db_user'@'localhost' IDENTIFIED BY '$db_password';
FLUSH PRIVILEGES;
EXIT;
EOF

echo "=== Datenbank '$db_name' wurde erfolgreich erstellt und der Benutzer '$db_user' konfiguriert. ==="

