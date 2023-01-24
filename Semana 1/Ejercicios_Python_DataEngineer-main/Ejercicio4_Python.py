'''
Dadas dos listas, debes generar una tercera con todos los elementos que se
repitan en ellas, pero no debe repetirse ningún elemento en la nueva lista:
'''
lista_1 = ["h",'o','l','a',' ', 'm','u','n','d','o']
lista_2 = ["h",'o','l','a',' ', 'l','u','n','a']
nueva_lista = []
for element in lista_2:
    if element in lista_1:
        nueva_lista.append(element)
print([*set(nueva_lista)])