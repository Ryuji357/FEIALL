# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 21:08:53 2020

@author: Ryuji
"""

'''
Crie um programa em Python que lê uma string digitada pelo usuário
e conta quantas palavras tem nessa string. Seu programa deve exibir
uma mensagem com o numero de palavras contadas. 
'''

texto = input()
print(len(texto.split(' ')))