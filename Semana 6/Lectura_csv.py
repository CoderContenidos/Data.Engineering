# De ser necesario se puede usar colab
from google.colab import drive
import os
drive.mount('/content/gdrive')
##################################

%cd '/content/gdrive/MyDrive'

import pandas as pd
### Lectura de archivo
df= pd.read_csv('winequality-red.csv',sep=',')
# Mostrar primeras 5 filas
df.head()
# Elección de columnas a mostrar
print(df[['density','pH','sulphates','alcohol','quality']].head())
