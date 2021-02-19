# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 19:02:51 2020

@author: Ryuji
"""

'''
Usando as bibliotecas Matplotlib e Pandas, faça um gráfico comparando o preço
médio anual do ouro com o preço médio anual  da bolsa de NY, com título,
rótulos dos eixos e legenda, dos anos 2000 até 2015.

(A resposta deve ser o código Python para fazer o gráfico, e não o gráfico em
si.)
'''

import pandas as pd
import matplotlib.pyplot as plt

# Importa os dados como string para evitar perdas
dados_ouro = pd.read_csv('gold_prices_monthly.csv')
dados_bolsa = pd.read_csv('SP500_prices_montly.csv')

# Converte para data
dados_ouro['Date'] = pd.to_datetime(dados_ouro['Date'], format='%Y-%m')
dados_bolsa['Date'] = pd.to_datetime(dados_bolsa['Date'], format='%Y-%m-%d')

anos = list()
media_ouro = list()
media_bolsa = list()

for ano in range(2000, 2016, 1):
    # Separando os dados
    dados_ouro_sep = dados_ouro.loc[
        (dados_ouro['Date'] >= pd.to_datetime(
            '01/01/{}'.format(ano), format='%d/%m/%Y'
        )) &
        (dados_ouro['Date'] <= pd.to_datetime(
            '31/12/{}'.format(ano), format='%d/%m/%Y'
        ))
    ]
    dados_bolsa_sep = dados_bolsa.loc[
        (dados_bolsa['Date'] >= pd.to_datetime(
            '01/01/{}'.format(ano), format='%d/%m/%Y'
        )) &
        (dados_bolsa['Date'] <= pd.to_datetime(
            '31/12/{}'.format(ano), format='%d/%m/%Y'
        ))
    ]

    anos.append(ano)
    media_ouro.append(dados_ouro_sep['Price'].mean())
    media_bolsa.append(dados_bolsa_sep['Price'].mean())

plt.plot(anos, media_ouro)
plt.plot(anos, media_bolsa)
plt.xlim(2000, 2015)
plt.grid(linestyle='--') # Grid

plt.legend(['Média anual do ouro', 'Média anual da Bolsa NY'])
plt.title('Historico valor da bolsa de NY (média anual)')
plt.xlabel('Ano')
plt.ylabel('Média')

plt.show()