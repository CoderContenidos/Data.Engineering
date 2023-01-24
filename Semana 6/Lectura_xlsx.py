# De ser necesario usar colab
from google.colab import drive
import os
drive.mount('/content/gdrive')
# Cambiar ruta de acceso
%cd '/content/gdrive/MyDrive'
import pandas as pd
# Lectura de archivo
df= pd.read_excel('defaultoutput.xlsx')
# Mostrar las priemra 5 filas
df.head()
# Elegir columnas de interés
print(df[['index','ID','Year_Birth','Education','Income']].head())
