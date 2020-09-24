# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 18:29:58 2020

@author: Ryuji
"""

'''
Crie um programa que receba o nome de um arquivo e verifica
se o arquivo existe. Retorne true se existir, e false se não
existir.
'''

# Brincando
'''
caminho = input()

try:
    arquivo = open(caminho)
    print(True)
except:
    print(False)
'''

import os

caminho = input()

print(os.path.isfile(caminho))