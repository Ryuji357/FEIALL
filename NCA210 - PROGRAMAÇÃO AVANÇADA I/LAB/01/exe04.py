# -*- coding: utf-8 -*-
"""
Created on Wed Aug 12 21:30:06 2020

@author: Ryuji
"""

'''
Um reservatório vazio deve ser abastecido por uma bomba.
Conhecendo-se a vazão da bomba (em litros por segundo) e
a capacidade do reservatório (em litros). Calcule o tempo
que levará para encher o reservatório em: segundos,
minutos e horas (quantidades inteiras).
'''

v = float(input('Entre com a vazao: '))
c = float(input('Entre com a capacidade: '))

segundos = c//v
minutos = segundos//60

t_segundos = segundos%60
t_minutos = minutos%60
t_horas = minutos//60

print('{} horas {} minutos {} segundos'.format(t_horas, t_minutos, t_segundos))