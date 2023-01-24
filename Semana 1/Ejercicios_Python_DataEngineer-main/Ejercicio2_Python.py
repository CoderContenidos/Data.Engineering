'''
Escribí un programa que pida al usuario cuantos números quiere introducir. Luego lee
todos los números y realiza una media aritmética:
'''
cantidad=int(input('Introduce una cantidad de numeros para sacar la media:'))
lista=[]
for i in range(cantidad):
    a=float(input('Introduce el numero {}:'.format(i+1)))
    lista.append(a)
print('La media de los numeros es:', sum(lista)/len(lista))