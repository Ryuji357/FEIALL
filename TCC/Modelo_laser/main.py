import math

# Parametros do laser
w = 650 # Comprimento de onda [nm]
p_l = 5e-3 # Potencia de saida do laser [w]
v_i = 2.7 # Tensão de entrada [V]
i_i = 80e-3 # Corrente de entrada [A]

p_i = v_i*i_i
n_el = p_l/p_i

# Parametros do sistema
d = 1000 # Distancia [m]

# Parametros da atmosfera
capa = 10 # Visibilidade (6km<capa<50km para ar limpo) [km]
ro = 1.3 # Tamanho da distribuição de particulas (1.3 para ar limpo)

# Constantes dos calculos (não mexa)
c = 299792458 # Velocidade da luz [m/s]
k = 1.38064852e-23 # Constante de Boltzmann [J/K]
h = 6.62606957e-34 # Constante de Planck [J*s]

sigma = 3.92 # adimensional
qui = 550 # [nm]

# Eficiencia da tranmissão
alfa = (sigma/capa)*((w/qui)**(-ro))
n_tra = math.exp(-alfa*d/1000)

# Eficiencia do sistema
n_o = n_el*n_tra

print('Eficiencia da converção eletrico-laser: {:.1f}%'.format(round(n_el*100, 2)))
print('Eficiencia de transmissão no ar é de: {:.1f}% a uma distancia de {:.1f} m.'.format(round(n_tra*100,1), d))
print('')
print('Eficiencia do sistema (end-to-end): {:.1f}%'.format(round(n_o*100, 2)))
