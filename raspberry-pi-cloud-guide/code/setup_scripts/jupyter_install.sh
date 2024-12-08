#!/bin/bash

# Skript zur Installation von Jupyter Notebook

echo "=== Installation von Jupyter Notebook ==="

# Aktualisierung der Paketliste
sudo apt update

# Installation von pip und Jupyter Notebook
sudo apt install python3-pip -y
pip3 install notebook

# Generierung der Konfigurationsdatei
jupyter notebook --generate-config

# Anpassung der Konfiguration
CONFIG_FILE="$HOME/.jupyter/jupyter_notebook_config.py"
if [ -f "$CONFIG_FILE" ]; then
    echo "c.NotebookApp.port = 8889" >> $CONFIG_FILE
    echo "c.NotebookApp.ip = '0.0.0.0'" >> $CONFIG_FILE
    echo "c.NotebookApp.open_browser = False" >> $CONFIG_FILE
    echo "Konfiguration erfolgreich angepasst."
else
    echo "Fehler: Konfigurationsdatei nicht gefunden!"
fi

echo "=== Jupyter Notebook ist bereit! ==="

