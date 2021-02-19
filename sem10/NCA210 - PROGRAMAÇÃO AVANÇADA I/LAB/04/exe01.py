# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 20:51:55 2020

@author: Ryuji
"""

'''
Crie um programa que realize a soma de todos os elementos da diagonal
principal de uma matriz 5 x 5, preenchida com números de 1 a 25.

Saida esperada:

65
'''

'''
matriz = list()

for x in range(5):
    matriz.append(list())
    for y in range(1, 6):
        matriz[x].append(x*5 + y)
'''

matriz = [[y*5 + x for x in range(1, 6)] for y in range(5)]

print(sum([matriz[x][x] for x in range(5)]))