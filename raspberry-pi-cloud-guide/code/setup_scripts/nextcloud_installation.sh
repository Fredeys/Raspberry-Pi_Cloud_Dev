#!/bin/bash

# Skript zur Installation und Konfiguration von Nextcloud

echo "=== Installation und Konfiguration von Nextcloud ==="

# Schritt 1: Installation der Software
echo "1. Herunterladen und Installieren von Nextcloud..."
NEXTCLOUD_VERSION="28.0.0"
NEXTCLOUD_URL="https://download.nextcloud.com/server/releases/nextcloud-${NEXTCLOUD_VERSION}.tar.bz2"

# Herunterladen der Nextcloud-Software
wget $NEXTCLOUD_URL

# Entpacken und Verschieben in das Webserver-Verzeichnis
tar -xvf "nextcloud-${NEXTCLOUD_VERSION}.tar.bz2"
sudo mv nextcloud /var/www/html/
sudo chown -R www-data:www-data /var/www/html/nextcloud

# Schritt 2: Konfiguration des Apache-Webservers
echo "2. Konfigurieren des Apache-Webservers..."
CONF_FILE="/etc/apache2/sites-available/nextcloud.conf"

# Erstellen der Konfigurationsdatei
sudo bash -c "cat > $CONF_FILE" <<EOL
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/nextcloud

    <Directory /var/www/html/nextcloud/>
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews

        <IfModule mod_dav.c>
            Dav off
        </IfModule>
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

# Aktivieren der neuen Konfiguration und Apache-Module
sudo a2ensite nextcloud
sudo a2enmod rewrite headers env dir mime
sudo systemctl restart apache2

echo "Apache-Webserver wurde erfolgreich konfiguriert."

# Schritt 3: Zugriff auf Nextcloud
echo "3. Zugriff auf Nextcloud"
echo "Nach der erfolgreichen Konfiguration kannst du im Browser auf Nextcloud zugreifen:"
echo "  http://IP-Adresse/nextcloud"
echo "Ersetze 'IP-Adresse' durch die IP deines Raspberry Pi."

# Schritt 4: Datenbankkonfiguration im Browser
echo "4. Datenbank-Konfiguration"
echo "Im Browser gib die folgenden Informationen ein, um Nextcloud fertig zu konfigurieren:"
echo "  - Datenbank-Benutzer: nextclouduser"
echo "  - Datenbank-Name: nextcloud"
echo "  - Passwort: Das während der Einrichtung festgelegte Passwort."
echo "Lege außerdem einen neuen Administrator-Benutzer an."

echo "=== Installation abgeschlossen! ==="

