clear;
clc;

# Parametros do laser
w = 810; # Comprimento de onda [nm]
p_l = 5 # Potencia de sa�da do laser [w]
v_i = 5 # Tens�o de entrada [V]
i_i = 1; # Corrente [A]

p_i = v_i*i_i # Potencia consumida laser [w]
n_el = p_l/p_i # Eficiencia do laser

# Parametros do sistema
d = 0:1:100; # Distancia [m]

# Parametros da atmosfera
capa = 10; # Visibilidade (6km<capa<50km para ar limpo) [km]
ro = 1.3; # Tamanho da distribui��o de particulas (1.3 para ar limpo)

# Constantes dos calculos (n�o mexa)
c = 299792458; # Velocidade da luz [m/s]
k = 1.38064852e-23; # Constante de Boltzmann
h = 6.62606957e-34; # Constante de Planck

sigma = 3.92; # adimensional
qui = 550; # [nm]

# Eficiencia da tranmiss�o
alfa = (sigma/capa)*((w/qui)**(-ro));
n_tra = exp(-alfa*d/1000);

plot(d, n_tra);
grid;

