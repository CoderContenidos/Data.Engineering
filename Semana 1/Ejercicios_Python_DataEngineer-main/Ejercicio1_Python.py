'''
Escribí un programa que lea un número impar por teclado. Si el usuario no
introduce un número impar, debe repetirse el proceso hasta que lo introduzca
correctamente.
'''
while True:
    if int(input('Introduce un numero impar:'))% 2==0:
        print('Incorrecto introduce un numero impar') 
    else:
        print('Ciclo finalizado')
        break
