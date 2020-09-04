# -*- coding: utf-8 -*-
"""
Created on Wed Aug 26 20:54:32 2020

@author: Ryuji
"""

neg = list()
pos = list()

while True:
    x = int(input('Insira um valor: '))
    if x == 0:
        break
    neg.append(str(x)) if x < 0 else pos.append(str(x))

print(', '.join(neg))
print(', '.join(pos))