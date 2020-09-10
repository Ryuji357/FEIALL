# -*- coding: utf-8 -*-
"""
Created on Tue Sep  8 14:09:23 2020

@author: Ryuji
"""

import csv
import numpy as np
import matplotlib.pyplot as plt

def ler_csv(caminho):
    with open(caminho, newline='') as csvfile:
        spamreader = csv.reader(
            csvfile,
            delimiter=';',
            quotechar='"'
        )
        result = csv.DictReader(spamreader)
    return result

if __name__ == '__main__':
    pontos = ler_csv('teste.csv')
    fig, ax = plt.subplots()
    ax.plot(pontos['pos'], pontos['alt'])
    ax.legend()

    plt.show()