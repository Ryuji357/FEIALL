# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 21:09:34 2020

@author: Ryuji
"""

'''
Neste exercício, você simulará 1.000 lançamentos de dois dados. 

Comece escrevendo uma função que simula o lançamento de um par de dados de
seis lados cada. Sua função não deve aceitar nenhum parâmetro. Ela retornará
a somatória obtida pelos dois dados. 

Escreva um programa principal que use sua função para simular 1.000 lançamentos
de dois dados. Como acontece em alguns programas, você deve contar o número de
vezes que cada somatória acontece. Em seguida, a função principal deve exibir
uma tabela que resume esses resultados. Mostre a frequência para cada resultado
como uma porcentagem do número total de lançamentos. Use Dicionários.
'''

import random

def lanca_dados():
    return random.randint(1, 6) + random.randint(1, 6)

result = dict()
todos = list()

for x in range(1000):
    d = lanca_dados()
    todos.append(d)
    if d in result:
        qt = result[d]['quantidade'] + 1
        result[d]['quantidade'] = qt
        result[d]['porcentagem'] = '{:5.1f}%'.format(qt/10)
    else:
        result[d] = {
            'quantidade': 1,
            'porcentagem': '{:5.2f}%'.format(1/10)
        }

print(result)