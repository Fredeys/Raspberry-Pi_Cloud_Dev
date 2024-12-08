import seaborn as sns
import pandas as pd

# Titanic-Dataset laden
titanic = sns.load_dataset('titanic')

# Dataset als CSV speichern
titanic.to_csv('/home/pi/titanic.csv', index=False)
print("Titanic-Dataset wurde als 'titanic.csv' gespeichert.")

