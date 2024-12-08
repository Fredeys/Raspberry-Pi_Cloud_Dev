# Raspberry Pi als Cloud-Lösung und Entwicklungsplattform

🚀 **Einrichtung eines Raspberry Pi als Cloud-Server**  
Dieses Projekt zeigt, wie ein Raspberry Pi als kostengünstiger Cloud-Server mit SQL-Datenbank und Python-Unterstützung eingerichtet wird. Zusätzlich bietet es ein Beispiel zur Datenanalyse, das als Grundlage für weiterführende Arbeiten in den Bereichen **Data Science** und **Automatisierung** dient.

---

## 📖 Einleitung

### 🌟 Überblick zum Projekt
- Ziel: Einrichtung eines Raspberry Pi als Cloud-Server mit SQL-Datenbank und Python-Skripten.
- Fokus: 
  - Installation und Konfiguration von Hardware und Software.
  - Durchführung einer Beispiel-Datenanalyse (z. B. Titanic-Dataset).
- Nutzen: Grundlage für weitere Arbeiten in Data Science und Automatisierung.

### 🔍 Warum Raspberry Pi?
Der Raspberry Pi ist ein vielseitiger, kostengünstiger Einplatinencomputer, der sich ideal für:
- **Cloud-Computing**,
- **Automatisierung** und
- **IoT-Projekte** eignet.

In diesem Projekt wurde ein **Raspberry Pi 4** als Basis für:
- die Implementierung einer Cloud-Lösung,
- die Ausführung von Python-Skripten und
- die Integration von SQL-Datenbanken verwendet.

---

## 🛠️ Methodik

### 🚧 Projektphasen
Das Projekt gliedert sich in drei Hauptschritte:
1. **Raspberry Pi einrichten**: Installation von Hardware und Betriebssystem.
2. **Cloud-Server konfigurieren**: Einrichtung eines Webservers und einer SQL-Datenbank.
3. **Python-Anwendungen**: Ausführung von Python-Skripten in der Cloud.

---

## 🖥️ Einrichtung des Raspberry Pi

### 1️⃣ Installation des Betriebssystems
1. Lade den [Raspberry Pi Imager](https://www.raspberrypi.com/software/) herunter und installiere ihn auf deinem PC.
2. Wähle **Raspberry Pi OS (64-BIT)** und konfiguriere:
   - Benutzername und Passwort,
   - Landeseinstellungen und WLAN.
3. Schreibe das Betriebssystem auf die SD-Karte.
4. Entnehme die SD-Karte und setze sie in den Raspberry Pi ein.

### 2️⃣ Netzwerkverbindung und SSH-Zugriff
1. Lade den [Angry IP Scanner](https://angryip.org) herunter, um die IP-Adresse des Raspberry Pi zu ermitteln.
2. Verbinde dich per SSH:
   ```bash
   ssh <Benutzername>@<IP-Adresse>
    ```
3. Bestätige den Verbindungsaufbau
   ```bash
   Are you sure you want to continue connecting (yes/no)? yes
   ```
4. Melde dich mit deinem Passwort an.
5. Konfiguriere den Raspberry Pi:
   ```bash
   sudo raspi-config
   ```
- Gehe zu Interface Options.
- Aktiviere den VNC-Server für grafischen Zugriff.
- Speichere und beende die Konfiguration.

---

## 🖥️ Einrichtung des VNC-Viewers

### 1️⃣ Download und Installation
Lade den **VNC-Viewer** herunter und installiere ihn:  
🔗 [Download VNC Viewer](https://www.realvnc.com/de/connect/download/viewer/)


### 2️⃣ Verbindung zum Raspberry Pi herstellen
1. Öffne den VNC-Viewer und erstelle eine neue Verbindung:
   - **VNC-Server**: Gib die IP-Adresse des Raspberry Pi ein.
   - **Name**: Wähle einen Namen, um die Verbindung zu identifizieren (z. B. "Raspberry Pi Cloud").
2. Speichere die Verbindung.


### 3️⃣ Authentifizierung und Zugriff
1. Beim ersten Verbindungsaufbau erscheint folgende Meldung:
   ```plaintext
   Identity Check – VNC Viewer has no record of connecting to this VNC Server.
   ```
   Klicke auf continue um fortzufahren.
     
2. Gib die Zugangsdaten ein:
- **Benutzername**: Der Benutzername, der bei der Einrichtung des Raspberry Pi festgelegt wurde.
- **Passwort**: Das bei der Einrichtung festgelegte Passwort.
  
3. Nach erfolgreicher Authentifizierung erhältst du Zugriff auf die grafische Oberfläche des Raspberry Pi.

### 4️⃣ Graphischer Zugriff
Starte den VNC-Server auf dem Raspberry Pi mit folgendem Befehl:
```bash
vncserver-x11
```

### ℹ️ Zusätzlicher Hinweis
Mit einem VNC-Account kannst du den Zugriff auf den Raspberry Pi auch ortsunabhängig ermöglichen.

---

## ☁️ Cloud-Setup

### 1️⃣ Installation des Webservers
Richte den Apache-Webserver für die Cloud ein:

1. Aktualisiere die Paketliste:
   ```bash
   sudo apt update
   ```
2. Installiere Apache und PHP-Pakete:
   ```bash
   sudo apt install apache2 -y
   sudo apt install php php-gd php-curl php-zip php-xml php-mysql -y
   ```

### 2️⃣ Einrichtung der Datenbank
Installiere und konfiguriere MariaDB als Datenbank-Management-System:
1. Installiere MariaDB:
```bash
sudo apt install mariadb-server -y
```
2. Starte die sichere Installation:
```bash
sudo mysql_secure_installation
```
Befolge die Anweisungen zur Konfiguration:
- Passwort setzen: Optional.
- Anonyme Benutzer entfernen: Ja.
- Root-Login deaktivieren: Ja.
- Test-Datenbank entfernen: Ja.
- Privilegien-Tabelle neu laden: Ja.

Nachdem du Zugriff auf MariaDB erhalten hast, führe folgende Schritte aus, um eine neue Datenbank für Nextcloud zu erstellen und Benutzerrechte zu konfigurieren:

1. Melde dich bei MariaDB an:
   ```bash
   sudo mysql -u root -p
   ```
   Hinweis: Gib dein Root-Passwort ein oder drücke die Enter-Taste, wenn kein Passwort erforderlich ist.
   
2. Erstelle eine neue Datenbank für Nextcloud:
   ```bash
   CREATE DATABASE nextcloud;
   ```
3. Konfiguriere die Benutzerrechte:
   ```bash
   GRANT ALL ON nextcloud.* TO 'nextclouduser'@'localhost' IDENTIFIED BY 'deinPasswort';
   FLUSH PRIVILEGES;
   ```
4. Beende die MariaDB-Sitzung:
   ```bash
   EXIT;
   ```
Die Datenbank nextcloud wurde erfolgreich erstellt und mit einem Benutzer nextclouduser verknüpft. Diese ist nun bereit für die Integration mit Nextcloud.

---

## ☁️ Installation von Nextcloud

### 1️⃣ Softwareinstallation
Um Nextcloud auf deinem Raspberry Pi zu installieren, führe die folgenden Schritte im Terminal aus:

1. Lade die neueste Version von Nextcloud herunter:
   ```bash
   wget https://download.nextcloud.com/server/releases/nextcloud-28.0.0.tar.bz2
   ```
2. Entpacke die heruntergeladene Datei:
   ```bash
   tar -xvf nextcloud-28.0.0.tar.bz2
   ```
3. Verschiebe die entpackte Nextcloud-Software in das Apache-Webserver-Verzeichnis:
   ```bash
   sudo mv nextcloud /var/www/html/
   ```
4. Setze die notwendigen Berechtigungen:
   ```bash
   sudo chown -R www-data:www-data /var/www/html/nextcloud
   ```

### 2️⃣ Konfiguration des Apache-Webservers
1. Erstelle eine neue Apache-Konfigurationsdatei für Nextcloud:
   ```bash
   sudo nano /etc/apache2/sites-available/nextcloud.conf
   ```
2. Füge den folgenden Inhalt ein:
   ```bash
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
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
   </VirtualHost>
   ```
   Speichere die Datei und schliesse den Editior.
3. Aktiviere die neue Konfiguration und benötigte Apache-Module:
   ```bash
   sudo a2ensite nextcloud
   sudo a2enmod rewrite headers env dir mime
   ```
4. Starte den Apache-Webserver neu:
   ```bash
   sudo systemctl restart apache2
   ```
### 3️⃣ Zugriff auf Nextcloud über den Browser
1. Öffne einen Webbrowser und gib die URL deines Raspberry Pi ein:
   ```bash
   http://<IP-Adresse>/nextcloud
   ```
2. Auf der Installationsseite richte einen neuen Administrator-Benutzer ein:
   - Benutzername: Dein gewünschter Admin-Name.
   - Passwort: Ein sicheres Passwort.
     
3. Konfiguriere die Datenbank:
   - Datenbank-Benutzer: nextclouduser
   - Datenbank-Name: nextcloud
   - Passwort: Das während der Einrichtung gesetzte Passwort.
   
4. Schließe die Installation ab. Du wirst zur Nextcloud-Startseite weitergeleitet, wo du empfohlene Apps installieren kannst.

#### 💡 Hinweis
Nach der Installation kann Nextcloud für:
- Dateifreigabe,
- Synchronisation und
- andere Cloud-Dienste genutzt werden.

---

## 🐍 Python-Skripte in der Cloud

### 1️⃣ Einrichtung von Jupyter Notebook

#### Schritt 1: Installation von Jupyter Notebook
Führe die folgenden Befehle aus, um Jupyter Notebook zu installieren:
```bash
sudo apt update
sudo apt install python3-pip -y
pip3 install notebook
```

#### Schritt 2: Konfiguration von Jupyter Notebook

1. Generiere die Konfigurationsdatei:
   ```bash
    jupyter notebook --generate-config
   ```
2. Öffne die Konfigurationsdatei:
   ```bash
   nano ~/.jupyter/jupyter_notebook_config.py
   ```
3. Füge den folgenden Code ein:
   ```bash
    c.NotebookApp.port = 8889
    c.NotebookApp.ip = '0.0.0.0'
    c.NotebookApp.open_browser = False
    Speichere die Datei und schließe den Editor.
    Schritt 3: Starten von Jupyter Notebook
   ```
4. Starte Jupyter Notebook:
   ```bash
   jupyter notebook
   ```
5. Kopiere den Link aus dem Terminal und füge ihn in deinen Browser ein, um Jupyter zu öffnen.


### 2️⃣ Titanic-Dataset in der Cloud speichern und verarbeiten
####Schritt 4: Installation von Seaborn
Installiere das Python-Paket seaborn und überprüfe die Installation:
```bash
sudo apt update
sudo apt install python3-seaborn -y
python3 -c "import seaborn as sns; print('Seaborn installiert')"
```

#### Schritt 5: Titanic-Dataset speichern
1. Erstelle ein Python-Skript namens save_titanic.py mit folgendem Inhalt:
```bash
import seaborn as sns
import pandas as pd

# Titanic-Dataset laden
titanic = sns.load_dataset('titanic')

# Dataset als CSV speichern
titanic.to_csv('/home/pi/titanic.csv', index=False)
print("Titanic-Dataset wurde als 'titanic.csv' gespeichert.")
```
2. Führe das Skript aus:
```bash
python save_titanic.py
```
3. Verschiebe die erzeugte Datei in das Nextcloud-Verzeichnis:
```bash
sudo mv /home/pi/titanic.csv /var/www/html/nextcloud/
Setze die Zugriffsrechte für die Datei:
sudo chown www-data:www-data /var/www/html/nextcloud/titanic.csv
sudo chmod 644 /var/www/html/nextcloud/titanic.csv
```


### 3️⃣ Titanic-Dataset in Jupyter Notebook analysieren
1. Öffne Jupyter Notebook mit folgendem Befehl:
   ```bash
   jupyter notebook --port=8889 --no-browser
   ```
2. Erstelle ein neues Notebook und führe folgenden Python-Code aus:
   ```bash
    import pandas as pd
    
    # Titanic-Dataset laden
    df = pd.read_csv('/var/www/html/nextcloud/titanic.csv')
    print(df.head())
   ```
   
### 💡 Erwarteter Output
Die ersten fünf Zeilen des Titanic-Datasets:

| survived | pclass | sex    | age  | sibsp | parch | fare    | embarked | class  | who   | adult_male | deck | embark_town | alive | alone |
|----------|--------|--------|------|-------|-------|---------|----------|--------|-------|------------|------|-------------|-------|-------|
| 0        | 3      | male   | 22.0 | 1     | 0     | 7.2500  | S        | Third  | man   | True       | NaN  | Southampton | no    | False |
| 1        | 1      | female | 38.0 | 1     | 0     | 71.2833 | C        | First  | woman | False      | C    | Cherbourg   | yes   | False |
| 1        | 3      | female | 26.0 | 0     | 0     | 7.9250  | S        | Third  | woman | False      | NaN  | Southampton | yes   | True  |
| 1        | 1      | female | 35.0 | 1     | 0     | 53.1000 | S        | First  | woman | False      | C    | Southampton | yes   | False |
| 0        | 3      | male   | 35.0 | 0     | 0     | 8.0500  | S        | Third  | man   | True       | NaN  | Southampton | no    | True  |

Durch diese Schritte ist das Titanic-Dataset erfolgreich in der Cloud gespeichert und kann analysiert werden! 🚀




















