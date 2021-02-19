import random

# Exemplo 1
'''
inteiro = [random.randint(0, 100) for x in range(10)]
real = [random.uniform(0, 100) for x in range(15)]
complexo = [complex(input('Insira um numero em complexo ({}): '.format(x+1))) for x in range(5)]

completo = [inteiro, real, complexo]
del inteiro, real, complexo

print(completo)
'''

# Exemplo 2
'''
matriz = [[random.randint(0, 100) for x in range(5)] for y in range(10)]
print(matriz)
print([x[0] for x in matriz])
'''

# Exemplo 3
'''
matriz = [[random.randint(0, 10) for x in range(10)] for y in range(10)]
print(matriz)
print(sum([x.count(3) for x in matriz]))
'''

# Exemplo 4
'''
matriz = [[random.randint(0, 100) for x in range(10)] for y in range(10)]
print(max([max(x) for x in matriz]))
print(min([min(x) for x in matriz]))
'''

# Exemplo 5
'''
m = [[int(input('Insira um numero [{}, {}]: '.format(y, x))) for x in range(2)] for y in range(2)]
maximo = max([max(x) for x in m])
n = [[x*maximo for x in y] for y in m]
'''

# Exemplo 6

matriz = [[float(input('Insira um numero [{}, {}]: '.format(y, x))) for x in range(3)] for y in range(4)]



