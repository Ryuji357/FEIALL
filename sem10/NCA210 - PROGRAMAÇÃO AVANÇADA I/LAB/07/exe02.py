# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 18:30:35 2020

@author: Ryuji
"""

'''
Crie um programa que receba o nome do arquivo e conte quantas
linhas, palavras e caracteres existente no arquivo. A função
deverá retornar os valores de quantidade de linhas, palavras
e caracteres 
'''

caminho = input()

with open(caminho) as arquivo:
    txt = arquivo.read()
    print(len(txt.splitlines()))
    print(len(txt.split()))
    print(len(txt))