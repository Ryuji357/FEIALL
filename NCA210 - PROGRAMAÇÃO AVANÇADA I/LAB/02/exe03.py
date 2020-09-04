# -*- coding: utf-8 -*-
"""
Atividade 03

@author: Ryuji
"""

'''
Escreva um programa que leia números digitados pelo usuário.
O programa deve ler os números até que 0 (zero) seja digitado.

Quando 0 for digitado, o programa deve exibir a quantidade de
dígitos que foram digitados, a somatória destes dígitos e a
média aritmética.
'''

soma = 0
i = 0

while True:
    num = int(input('Digite um número: '))
    if num == 0:
        break
    else:
        soma += num
        i += 1

media = soma/i

print('Quantidade de Dígitos: {}'.format(i))
print('Soma dos valores digitado: {}'.format(soma))
print('Média dos valores digitado: {:.2f}'.format(media))