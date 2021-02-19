# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 22:22:59 2020

@author: Ryuji
"""

'''
Faça um programa que crie uma lista contendo listas, onde cada
lista contem a sequência de Fibonacci, sempre iniciando em 0.

A Sequência de Fibonacci é uma sequência de números inteiros
iniciada em 0, na qual cada termos subsequente corresponde à
soma dos dois anteriores.

O programa deve solicitar como entrada do usuário a quantidade
de listas que ele deseja criar.

Exemplo de entrada:

5

Exemplo de resultado esperado:

[[0], 
[0, 1],
[ 0, 1, 1], 
[0, 1, 1, 2], 
[0, 1, 1, 2, 3]]
'''

numero = int(input('Insira um numero: '))
result = list()

for x in range(numero):
    if x == 0:
        result.append([0])
    elif x == 1:
        result.append([0, 1])
    else:
        result.append(result[x-1] + [result[x-1][-1] + result[x-1][-2]])

print(result)