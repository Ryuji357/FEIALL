# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 21:08:12 2020

@author: Ryuji
"""

'''
Um dicionário pode ser utilizado para representar um estoque de
uma empresa. Nele, todos os itens de uma empresa são registrados,
anotando a quantidade de itens disponíveis e o seu valor unitário.

Faça um programa que permita gerenciar um estoque de uma Quitanda.
O programa deve permitir inserir itens no estoque, remover itens,
modificar a quantidade e preço de um item e imprimir todo o estoque. 

Faça este programa usando funções e dicionários.

Teste o programa criando e manipulando um estoque de frutas.
'''

#Programa
estoque = dict()

def adiciona_item(codigo, quantidade=0.00, valor=0.00):
    estoque[str(codigo)] = {
        'quantidade': float(quantidade),
        'valor': float(valor)
    }

def remove_item(codigo):
    if codigo in estoque:
        del estoque[codigo]
    else:
        print('Esse código não existe.')

def altera_item(codigo, quantidade=None, valor=None):
    if codigo in estoque:
        if quantidade is not None:
            estoque[codigo]['quantidade'] = quantidade
        if valor is not None:
            estoque[codigo]['valor'] = valor
    else:
        print('Esse código não existe.')

#Teste
adiciona_item('Maça', 10, 2.50)
adiciona_item('Pera', 5, 4.75)
adiciona_item('Uva', 99, 356.00)
adiciona_item('Mamão', 10, 7.80)

print(estoque)

remove_item('Mamão')

print(estoque)

altera_item('Uva', quantidade = 0)

print(estoque['Uva'])

altera_item('Uva', 7, 5.00)

print(estoque)