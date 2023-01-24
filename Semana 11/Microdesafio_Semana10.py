from datetime import datetime
from email import message
from airflow.models import DAG, Variable
from airflow.operators.python_operator import PythonOperator

import smtplib

pais=['Argentina','Brasil','Colombia','Chile','Paraguay','Uruguay','Venezuela','Peru','Ecuador','Bolivia','México']
acronimo= ['AR','BR','CO','CL','PY','UR','VE','PE','EC','BO','MX']
lista_fin_mundo=[2040,2080,2095,2100,2089,2093,2054,2078,2079,2083,2071]

texto=[]

for i in range(len(pais)):
    string='Pais {} ({}), Fecha fin mundo estimada: {}'.format(pais[i], acronimo[i],lista_fin_mundo[i])
    texto.append(string)

final = '\n'.join(texto)
print(final)

def enviar():
    try:
        x=smtplib.SMTP('smtp.gmail.com',587)
        x.starttls()
        x.login('tu_email@gmail.com','NO_TE_DIRE_MI_CONTRASEÑA') # Cambia tu contraseña !!!!!!!!
        subject='Fechas fin del mundo'
        body_text=final
        message='Subject: {}\n\n{}'.format(subject,body_text)
        x.sendmail('tu_email@gmail.com','destinatario@gmail.com',message)
        print('Exito')
    except Exception as exception:
        print(exception)
        print('Failure')

default_args={
    'owner': 'DavidBU',
    'start_date': datetime(2022,9,7)
}

with DAG(
    dag_id='dag_smtp_email_fin_mundo',
    default_args=default_args,
    schedule_interval='@daily') as dag:

    tarea_1=PythonOperator(
        task_id='dag_envio_fin_mundo',
        python_callable=enviar
    )

    tarea_1
