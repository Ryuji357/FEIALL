# -*- coding: utf-8 -*-
"""
Created on Wed Aug 26 20:53:53 2020

@author: Ryuji
"""

todo = list()
par = list()
impar = list()

for x in range(1, 21):
    todo.append(str(x))
    par.append(str(x)) if x%2 == 0 else impar.append(str(x))

print(' '.join(todo))
print(' '.join(impar))
print(' '.join(par))