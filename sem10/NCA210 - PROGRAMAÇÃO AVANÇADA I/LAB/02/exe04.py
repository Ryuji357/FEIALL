# -*- coding: utf-8 -*-
"""
Atividade 04

@author: Ryuji
"""

'''
Faça um programa que gera 100 vezes um número
aleatório entre 1 e 100 e, então , exiba qual foi o maior
número gerado e quantas vezes o maior número foi
atualizado no seu código .
'''

from random import randrange

nmax = -1
c = 0
lista = list() # Para debug

for x in range(0, 100):
    ntemp = randrange(1, 101)
    lista.append(ntemp) # Para debug
    if ntemp > nmax:
        nmax = ntemp
        c = 1
    elif ntemp == nmax:
        c += 1

print('O maior numero foi {} e aparece {} veses.'.format(nmax, c))

#batata = max(lista)
#print(batata, lista.count(batata))