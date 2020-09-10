# -*- coding: utf-8 -*-
"""
Created on Thu Sep 10 18:27:19 2020

@author: Ryuji
"""

'''
Faça uma função que receba três notas de um aluno como
parâmetros e uma letra. 
Se a letra for A, a função deverá calcular a média aritmética
das notas do aluno; 
se for P deverá calcular a média ponderada com pesos 5, 3 e 2. 
A média calculada deve ser devolvida à função principal para,
então, ser impressa.
'''

def media(n1, n2, n3, p):
    if p == 'A':
        result = (n1 + n2 + n3)/3
    elif p =='P':
        result = n1*0.5 + n2*0.3 + n3*0.2
    else:
        print('Valor parametro invalido.')
        return
    return result