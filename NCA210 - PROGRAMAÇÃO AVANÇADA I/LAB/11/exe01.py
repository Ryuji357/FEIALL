# -*- coding: utf-8 -*-
"""
Created on Wed Nov  4 20:52:29 2020

@author: Ryuji
"""

'''
Carregue para um DataFrame a lista de municípios de fronteira do Brasil
utilizando o arquivo "arq_municipios_fronteiricos.csv".

Verifique os tipos de dados das colunas do dataframe. Todos os dados numéricos
deverão ser transformados para tipos numéricos.

    utilize o método info() do DataFrame para saber detalhes dos tipos de
    dados das colunas.
    verifique se os números possuem os símbolos de decimal e separadores de
    milhar. Elimine os símbolos se necessário.
'''

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