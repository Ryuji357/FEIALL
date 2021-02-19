# -*- coding: utf-8 -*-
"""
Created on Thu Sep 10 18:22:50 2020

@author: Ryuji
"""

'''
Escreva uma função com parâmetros que retorne o maior de dois
números. A função deve se chamar maximo(x, y), esse função
também deverá ter mais um parâmetro opcional chamado imprime,
que por padrão é Falso, mas quando True, deverá imprimir o valor
máximo.
'''

def maximo(x, y, imprime = False):
    result = x if x >= y else y
    if imprime:
        print(result)
    return result