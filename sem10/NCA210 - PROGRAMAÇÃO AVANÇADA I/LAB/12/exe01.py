# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 19:02:17 2020

@author: Ryuji
"""

'''
Usando as bibliotecas Matplotlib e Pandas, faça um gráfico com o preço
histórico do Ouro, com título, rótulos dos eixos e legenda.

Arquivo com o histórico do preço do ouro mensal: gold_prices_monthly.csv

(A resposta deve ser o código Python para fazer o gráfico, e não o gráfico em
si.)
'''

import pandas as pd
import matplotlib.pyplot as plt

# Importa os dados como string para evitar perdas
dados = pd.read_csv('gold_prices_monthly.csv', dtype=str)

# Dados x e y
x = pd.to_datetime(dados['Date'], format='%Y-%m') # Converte para data
y = dados['Price'].apply(float) # Converte para float

# Setup
plt.plot(x, y) # Dados
plt.xlim(x.min(), x.max()) # Limita a area de plotagem (só onde existe dados)
plt.grid() # Grid

# Legendas e titulo
plt.title('Historico valor ouro (mensal)')
plt.xlabel('Tempo')
plt.ylabel('Valor')

# Exibe o grafico
plt.show()