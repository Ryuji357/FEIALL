# -*- coding: utf-8 -*-
"""
Created on Wed Aug 26 20:54:41 2020

@author: Ryuji
"""

dim = int(input())
ver1 = [int(input()) for x in range(dim)]
ver2 = [int(input()) for x in range(dim)]

result = 0

for x in range(dim):
    result += ver1[x]*ver2[x]

print(result)