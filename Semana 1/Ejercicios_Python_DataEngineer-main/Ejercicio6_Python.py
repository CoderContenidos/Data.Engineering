'''
Contar cuantas veces aparece un elemento en una lista
'''
def conteo(lista, elemento):
    contador = 0
    for elemento in lista:
        if (elemento == x):
            contador = contador + 1
    return contador
 
lt = [8, 6, 8, 10, 8, 20, 10, 8, 8]
x = 8 #elemento
print('{} aparece {} veces'.format(x, conteo(lt, x)))