# -*- coding: utf-8 -*-
"""
Created on Thu Aug  5 23:48:57 2021

@author: Ryuji
"""

class vetor:
    x = 0
    y = 0

    def __init__(self, x = 0, y = 0):
        self.x = x
        self.y = y

    def __str__(self):
        return 'Vetor [{} {}]'.format(self.x, self.y)

    def __add__(self, other):
        if type(other) is vetor:
            x = self.x + other.x
            y = self.y + other.y
            return vetor(x, y)
        else:
            raise ValueError('Valores não compativeis.')