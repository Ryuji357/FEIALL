# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 19:02:42 2020

@author: Ryuji
"""

'''
Usando as bibliotecas Matplotlib e Pandas, faça um gráfico de barras com a
média anual do preço histórico da bolsa de NY, com título, rótulos dos eixos e
legenda, dos anos 2000 até 2010.

Arquivo com o histórico do preço da Bolsa, diário: SP500_prices_montly.csv

(A resposta deve ser o código Python para fazer o gráfico, e não o gráfico em
si.)
'''

import pandas as pd
import matplotlib.pyplot as plt

dados = pd.read_csv('SP500_prices_montly.csv')

# Converte para data
dados['Date'] = pd.to_datetime(dados['Date'], format='%Y-%m-%d')

x = list()
y = list()

for ano in range(2000, 2011, 1):
    dados_sep = dados.loc[
        (dados['Date'] >= pd.to_datetime(
            '01/01/{}'.format(ano), format='%d/%m/%Y'
        )) &
        (dados['Date'] <= pd.to_datetime(
            '31/12/{}'.format(ano), format='%d/%m/%Y'
        ))
    ]

    x.append(ano)
    y.append(dados_sep['Price'].mean())

del dados_sep

plt.bar(x, y)
plt.grid(linestyle='--') # Grid

plt.title('Historico valor da bolsa de NY (média anual)')
plt.xlabel('Ano')
plt.ylabel('Média')

plt.show()
