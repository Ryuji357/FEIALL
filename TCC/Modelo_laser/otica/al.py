# -*- coding: utf-8 -*-
"""
Created on Fri Aug  6 23:46:54 2021

@author: Ryuji
"""

class ponto:
    x = float()
    y = float()

    def __init__(self, x = 0, y = 0):
        self.x = float(x)
        self.y = float(y)

    def __str__(self):
        return 'Ponto: [{0} {1}]'.format(self.x, self.y)

    def __repr__(self):
        return 'ponto(x={0}, y={1})'.format(self.x, self.y)

    # Binary Operators
    def __add__(self, other):
        if isinstance(other, vetor):
            return ponto(self.x + other.x, self.y + other.y)
        else:
            raise ValueError('Operação inválida.')

    def __sub__(self, other):
        if isinstance(other, vetor):
            #print('Operação não recomendada, mude o sentido do vetor antes.')
            return vetor(self.x - other.x, self.y - other.y)
        elif isinstance(other, ponto):
            return vetor(self.x - other.x, self.y - other.y)
        else:
            raise ValueError('Operação inválida.')

class vetor:
    x = float()
    y = float()

    def __init__(self, x = 0, y = 0):
        self.x = float(x)
        self.y = float(y)

    def __str__(self):
        return 'Vetor: [{0} {1}]'.format(self.x, self.y)

    def __repr__(self):
        return 'vetor(x={0}, y={1})'.format(self.x, self.y)

    # Binary Operators
    def __add__(self, other):
        if isinstance(other, vetor):
            return vetor(self.x + other.x, self.y + other.y)
        elif isinstance(other, ponto):
            return ponto(self.x + other.x, self.y + other.y)
        else:
            raise ValueError('Operação inválida.')

    def __sub__(self, other):
        if isinstance(other, vetor):
            #print('Operação não recomendada, mude o sentido do vetor antes.')
            return vetor(x = self.x - other.x, y = self.y - other.y)
        else:
            raise ValueError('Operação inválida.')

    def __mul__(self, other):
        if isinstance(other, (int, float)):
            return vetor(x = self.x*other, y = self.y*other)
            #a = abs(self)
            #h = a * other
            #x = h*(self.x/a)
            #y = h*(self.y/a)
            #return vetor(x = x, y = y)
        else:
            raise ValueError('Operação inválida.')

    def __rmul__(self, other):
        if isinstance(other, (int, float)):
            return vetor(x = self.x*other, y = self.y*other)
            #a = abs(self)
            #h = a * other
            #x = h*(self.x/a)
            #y = h*(self.y/a)
            #return vetor(x = x, y = y)
        else:
            raise ValueError('Operação inválida.')

    def __truediv__(self, other):
        if isinstance(other, (int, float)):
            return vetor(x = self.x/other, y = self.y/other)
        else:
            raise ValueError('Operação inválida.')

    # Unary Operators
    def __neg__(self):
        return vetor(-self.x, -self.y)

    def __abs__(self):
        return float(((self.x)**2 + (self.y)**2)**0.5)

    # Outras operações
    def versor(self):
        return self*(1/abs(self))

# Pontos e vetores notaveis
O = ponto(0, 0)
i = vetor(1, 0)
j = vetor(0, 1)