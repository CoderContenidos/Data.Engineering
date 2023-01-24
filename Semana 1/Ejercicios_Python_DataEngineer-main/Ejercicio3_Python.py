'''
Utilizando la función range() y la conversión a listas genera las siguientes listas
dinámicamente:

● Todos los números del 0 al 10 [0, 1, 2, ..., 10]
● Todos los números del -10 al 0 [-10, -9, -8, ..., 0]
● Todos los números pares del 0 al 20 [0, 2, 4, ..., 20]
● Todos los números impares entre -20 y 0 [-19, -17, -15, ..., -1]
● Todos los números múltiples de 5 del 0 al 50 [0, 5, 10, ..., 50]
'''
print(list(range(0,10+1,1)));
print([x for x in range(-10, 1)])
print([x for x in range(0,20+1,1) if x%2==0])
print([x for x in range(-19, -1+1)])
print([x for x in range(0,50+1,1) if x%5==0])


