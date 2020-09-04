# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 21:11:10 2020

@author: Ryuji
"""

'''
Faça um programa que multiplica duas matrizes de tamanho 3 x 3,
sendo que a primeira matriz tem valores de 1 a 9, e a segunda de
10 a 18.

Saida esperada:
[[84, 90, 96], 
[201, 216, 231], 
[318, 342, 366]]
'''

m1 = [[y*3 + x for x in range(1, 4)] for y in range(3)]
m2 = [[y*3 + x for x in range(1, 4)] for y in range(3, 6)]

'''
for x in range(3):
    for y in range(3):
        for z in range(3):
'''     

mr = [[sum([m1[y][z]*m2[z][x] for z in range(3)]) for x in range(3)] for y in range(3)]
print(mr)