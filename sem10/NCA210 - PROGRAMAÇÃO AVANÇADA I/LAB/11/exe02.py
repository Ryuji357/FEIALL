# -*- coding: utf-8 -*-
"""
Created on Wed Nov  4 20:53:01 2020

@author: Ryuji
"""

'''
Carregue para um DataFrame a lista de municípios de fronteira do Brasil
utilizando o arquivo "arq_municipios_fronteiricos.csv".

Utilizando o DataFrame carregado no exercício anterior, calcule:

    A população média de todos os municípios.
    O município com maior e o com menos área.
    O municipio com menor IDH
    O estado com maior renda per capita.
'''

#%% Do exercicio anterior

import pandas

def formatar(valor):
    # Coonverte o valor para float
    if valor == 'ni':
        valor = None
    else:
        valor = valor.replace(' ', '')
        valor = valor.replace('.', '')
        valor = valor.replace(',', '.')
        valor = float(valor)
    return valor

dados = pandas.read_csv('municipios_fronteiricos.csv', dtype=str)

afor = [
    'Área territorial',
    'População (IBGE/2007)',
    'Densidade demográfica (hab/km2)',
    'PIB (IBGE/2005',
    'PIB per capita (R$)',
    'IDH/2000'
]

for x in afor:
    dados[x] = dados[x].apply(formatar)

#%% Inicio do exercicio 2

pop_media = dados['População (IBGE/2007)'].mean()
area_max = dados['Área territorial'].max()
area_min = dados['Área territorial'].min()
idh_min = dados['IDH/2000'].min()
renda_max = dados['PIB per capita (R$)'].max()

print()
print('População média de todos os municípios:{:15.2f}'.format(pop_media))
print('Município com maior área:              {:15.2f}'.format(area_max))
print('Município com menor área:              {:15.2f}'.format(area_min))
print('Município com menor IDH:               {:15.2f}'.format(idh_min))
print('Município com maior renda per capita:  {:15.2f}'.format(renda_max))
