# -*- coding: utf-8 -*-
"""
Created on Wed Aug 12 21:12:58 2020

@author: Ryuji
"""

'''
Escreva um programa que pergunte a quantidade de km
percorridos por um carro alugado, assim como a quantidade
de dias pelos quais o carro foi alugado. Calcule o preço
a pagar, sabendo que o carro custa R$ 60,00 por dia e
R$ 0,15 por km rodado. 
'''

distancia = float(input('Digite os km:'))
dias = float(input('Digite os dias:'))

custo = 60.0*dias + 0.15*distancia
valor = 'R$ {:.2f}'.format(custo)

print(valor)