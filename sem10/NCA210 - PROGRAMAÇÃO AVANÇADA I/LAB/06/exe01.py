# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 21:01:43 2020

@author: Ryuji
"""

'''
Desenvolva um programa que recebe uma frase e imprima a quantidade
de palavras "FEI" na frase. O programa deve contar apenas a palavra
"FEI", ou "fei", mas não feio ou feijão.
'''

texto = input()
print(texto.lower().split(' ').count('fei'))