# -*- coding: utf-8 -*-
"""
Created on Wed Aug 26 20:54:53 2020

@author: Ryuji
"""

carros = list()
consumo = list()

for x in range(5):
    carros.append(input())

i = 0
for x in range(5):
    consumo.append(int(input()))
    if consumo[x] > consumo[i]:
        i = x

print(carros[i])

for x in consumo:
    print(round(1000/x))