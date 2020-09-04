# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 21:04:52 2020

@author: Ryuji
"""

'''
Faça um programa que cria uma matriz, A, 5 x 5 com números inteiros
em sequência e, então, exiba a matriz transposta de A ( At  ). 

Determinar a transposta de uma matriz é reescrevê-la de forma que
suas linhas e colunas troquem de posições ordenadamente, isto é,
a primeira linha é reescrita como a primeira coluna, a segunda linha
é reescrita como a segunda coluna e assim por diante, até que se
termine de reescrever todas as linhas na forma de coluna.

Saída esperada:

[[1, 6, 11, 16, 21], 

[2, 7, 12, 17, 22], 

[3, 8, 13, 18, 23], 

[4, 9, 14, 19, 24], 

[5, 10, 15, 20, 25]]
'''

A = [[y*5 + x for x in range(1, 6)] for y in range(5)]
At = [[A[x][y] for x in range(5)] for y in range(5)]
print(At)