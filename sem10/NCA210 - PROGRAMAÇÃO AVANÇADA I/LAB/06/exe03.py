# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 21:09:02 2020

@author: Ryuji
"""

'''
Implemente um programa que receba um nome completo e apresente
apenas o último nome e o 1o nome na seguinte forma:

último, 1o nome.

Exemplo:
Entrada:
Rafael Paes Oliveira 
Saída: 
Oliveira, Rafael.
'''

texto = input()
texto_lista = texto.split(' ')
print('{}, {}.'.format(texto_lista[-1], texto_lista[0]))