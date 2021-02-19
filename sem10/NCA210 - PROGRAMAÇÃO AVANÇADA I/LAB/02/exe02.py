# -*- coding: utf-8 -*-
"""
Atividade 02

@author: Ryuji
"""

'''
Faça um programa que realize a leitura de três notas parciais de um
aluno e calcule a média (M = (N1 + N2*2 + N3*3)/6) alcançada pelo
aluno e apresentar: 

A mensagem "Aprovado", se a média for maior ou igual a 5, com a
respectiva média alcançada; 
A mensagem "Reprovado", se a média for menor do que 5, com a
respectiva média alcançada;
'''

n1 = float(input('Digite a nota 1: '))
n2 = float(input('Digite a nota 2: '))
n3 = float(input('Digite a nota 3: '))

media = (n1 + n2*2 + n3*3)/6
condicao = 'aprovado' if media >= 5 else 'reprovado'

print('Aluno {} - Média: {:.2f}'.format(condicao, media))