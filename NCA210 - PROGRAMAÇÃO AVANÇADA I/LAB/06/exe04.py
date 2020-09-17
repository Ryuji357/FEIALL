# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 21:09:09 2020

@author: Ryuji
"""

'''
Crie um programa em Python que lê uma string digitada pelo usuário
e identifica a(s) palavra(s) mais longa(s) nessa string. Seu
programa deve exibir uma mensagem com o tamanho da palavra mais
longa e em seguida todas as palavras desse comprimento que
ocorreram na string. 
'''

'''
texto = input()
texto_lista = texto.split(' ')

result = ['']

for palavra in texto_lista:
    if len(palavra) > len(result[0]):
        result = [palavra]
    elif len(palavra) == len(result):
        result.append(palavra)

print(len(result[0]))

for x in result:
    print(x)
'''

texto = input()
texto_lista = texto.split(' ')

result = list()
temp = [len(x) for x in texto_lista]
maior = max(temp)

for palavra in texto_lista:
    if len(palavra) == maior:
        result.append(palavra)