# -*- coding: utf-8 -*-
"""
Created on Tue Sep  8 14:09:23 2020

@author: Ryuji
"""

import csv
import numpy as np
import matplotlib.pyplot as plt

def ler_csv(caminho, cols = ['pos', 'alt']):
    result = {}
    for x in cols:
        result[x] = list()
    with open(caminho, newline='') as csvfile:
        spamreader = csv.reader(
            csvfile,
            delimiter=';',
            quotechar='"'
        )
        for x in spamreader:
            for y in range(0, len(cols)):
                result[cols[y]].append(x[y])
    return result

class curva:
    ini = 0
    fim = 100
    offset = 0
    k=3/4

    def __init__(self):
        pass

    def ponto_y(self):
        print(self.offset)
        x = list()
        y = list()
        for z in range(0, 100, 10):
            x.append(z)
            y.append(z*self.offset)
        return x, y

    def gerar(self):
        print(self.offset)
        x = list()
        y = list()
        for z in range(0, 100, 10):
            x.append(z)
            y.append(z*self.offset)
        return x, y

if __name__ == '__main__':
    pontos = ler_csv('teste.csv')
    c = curva()
    c.offset = 1
    c1, c2 = c.gerar()

    pontosx = [int(x) for x in pontos['pos'][1:]]
    pontosy = [int(x) for x in pontos['alt'][1:]]

    fig, ax = plt.subplots()
    ax.plot(pontosx, pontosy)
    ax.plot(c1, c2)
    c.offset = 2
    ax.plot(c1, c2)
    ax.legend()

    plt.show()
