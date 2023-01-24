# De ser necesario usar colab
from google.colab import drive
import os
drive.mount('/content/gdrive')
# Cambiar ruta
%cd '/content/gdrive/MyDrive'
import pandas as pd
# Lectura de archivo
df= pd.read_csv('pokemon_data.txt',delimiter='\t')
# Mostrar ultimas 5 filas
df.tail()
# Mostrar ciertas columnas
print(df[['Name','Type 1','HP','Attack','Defense']].head())
