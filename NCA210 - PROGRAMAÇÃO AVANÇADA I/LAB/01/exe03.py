# -*- coding: utf-8 -*-
"""
Created on Wed Aug 12 21:29:56 2020

@author: Ryuji
"""

'''
Faça um Programa que peça a temperatura em graus Fahrenheit (F)
para o usuário. Então, transforma e exibe a temperatura em
graus Celsius (C).

C = (5 * (F-32) / 9)
'''

F = int(input('Digite a temperatura em graus Fahrenheit: '))
C = (5 * (F-32) / 9)
print('Temperatura em graus Celcius = {:.2f}'.format(C))