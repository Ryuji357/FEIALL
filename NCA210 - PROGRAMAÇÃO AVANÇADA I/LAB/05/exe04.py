# -*- coding: utf-8 -*-
"""
Created on Thu Sep 10 19:15:14 2020

@author: Ryuji
"""

'''
Implemente uma função chamada analise que recebe uma lista
e retorne a media, mediana, o valor mínimo e o máximo
respectivamente, independente do tamanho da lista.
''' 

def analise(lista):
    c = len(lista)

    media = sum(lista)/c

    if c%2 == 0:
        mediana = sum(lista[int(c/2):int(c/2)+1])/2
    else:
        mediana = lista[int(c/2)]

    maximo = max(lista)

    minimo = min(lista)

    return media, mediana, minimo, maximo