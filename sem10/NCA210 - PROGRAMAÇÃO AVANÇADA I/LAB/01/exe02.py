# -*- coding: utf-8 -*-
"""
Created on Wed Aug 12 21:29:47 2020

@author: Ryuji
"""

'''
Faça um programa que pergunte quanto você ganha por hora
e o número de horas trabalhadas no mês e calcule e mostre
o total do seu salário no referido mês, sabendo-se que são
descontados 11% para o Imposto de Renda, 8% para o INSS
e 5% para o sindicato, faça um programa que nos dê:
    O salário bruto.
    Quanto pagou ao INSS.
    Quanto pagou ao sindicato.
    O salário líquido.
'''

salario = input('Ganho por hora: ')
horas = input('Horas trabalhadas no mês: ')

sub_total = float(salario) * float(horas)
ir = sub_total*0.11
inss = sub_total*0.08
sindicato = sub_total*0.05
total = sub_total - ir - inss - sindicato

print('+Salário bruto {:.2f}'.format(sub_total))
print('-IR {:.2f}'.format(ir))
print('-INSS {:.2f}'.format(inss))
print('-Sindicato {:.2f}'.format(sindicato))
print('= Salário líquido {:.2f}'.format(total))