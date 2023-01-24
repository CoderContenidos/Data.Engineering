'''
Escribí un programa que sume todos los números enteros impares desde el 0 hasta
el 100:
'''
lista_v=[]
for i in range(1,100+1,1):
    if i %2 ==0:
        lista_v.append(0)
    else:
        lista_v.append(i)
print(sum(lista_v))