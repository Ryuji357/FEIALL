import math

e_a = 0.65 # Eficiencia antena A
d_a = 2.5 # Diametro da antena A (metros)
f_a = 12.25 # Frequencia (GHz)
p_a = 60 # Potencia (W)

e_b = 0.55 # Eficiencia antena B
d_b = 4.0 # Diametro da antena B (metros)
f_b = 9.5 # Frequencia (GHz)

# Não mexer aqui

# Constantes
c = 3e8 # Vel. luz

# Area parabolica
a_a = (math.pi*d_a)/4
a_b = (math.pi*d_b)/4

# Lambda
lambda_a = c/(f_a*1e9)
lambda_b = c/(f_b*1e9)

# Ganho
g_a = 10*math.log(e_a*(((math.pi*d_a)/lambda_a)**2), 10)
g_b = 10*math.log(e_b*(((math.pi*d_b)/lambda_b)**2), 10)

# Angulo de meia potencia
teta_a = (70*(math.pi/180)*lambda_a)/d_a
teta_b = (70*(math.pi/180)*lambda_b)/d_b

# Diretividade
D_a = (4*math.pi)/(teta_a**2)
D_b = (4*math.pi)/(teta_b**2)

# Densidade de potencia
S_a = (p_a)/(4*math.pi*(36000e3))
S_b = e_a*D_a*(p_a/(4*math.pi*36000e3))

p_b = S_b*a_b

# Respostas
print('Respostas')
print('Ganho em A: {}'.format(g_a))
print('Densidade de potencia: {}'.format(S_a))
print('Diretividade em B: {}'.format(D_b))
