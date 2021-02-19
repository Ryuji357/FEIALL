caracteres = {
    '1': 13,
    '2': 16,
    '3': 16,
    '4': 17,
    '5': 19,
    '6': 19,
    '7': 13,
    '8': 21,
    '9': 19,
    '0': 20
}

numero = input('Digite o numero: ')

total = 0
for x in numero:
    if x in caracteres.keys():
        total += caracteres[x]
    else:
        print('Caractere invalido.')
        break

print('{} LEDs'.format(total))
