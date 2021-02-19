# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 18:30:36 2020

@author: Ryuji
"""

'''
Escreva uma função em Python chamada somatorio() que receba o
nome de um arquivo e retorne a somatória de todos os números
que estão armazenados no arquivo. Todos os números do arquivo
estão na mesma e única linha, separados por espaço.
'''

def somatorio(caminho):
    with open(caminho) as arquivo:
        valores = arquivo.read().split()

    result = 0.0
    for x in valores:
        result += float(x)

    return result