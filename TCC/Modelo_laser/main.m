clear;
clc;

# luz solar
dp = 136.7; # mW/mm2

# Parametros do laser
w = 808; # Comprimento de onda [nm]
p_l = 25; # Potencia de saída do laser [w]
v_i = 8; # Tensão de entrada [V]
i_i = 9.5; # Corrente [A]

p_i = v_i*i_i; # Potencia consumida laser [w]
n_el = p_l/p_i; # Eficiencia do laser

# Parametros do sistema
d = 0:1:100; # Distancia [m]

# Parametros da atmosfera
capa = 10; # Visibilidade (6km<capa<50km para ar limpo) [km]
ro = 1.3; # Tamanho da distribuição de particulas (1.3 para ar limpo)

# Constantes dos calculos (não mexa)
c = 299792458; # Velocidade da luz [m/s]
k = 1.38064852e-23; # Constante de Boltzmann
h = 6.62606957e-34; # Constante de Planck

sigma = 3.92; # adimensional
qui = 550; # [nm]

# Eficiencia da tranmissão
n_tra = [];
for i = w
  alfa = (sigma/capa)*((i/qui)**(-ro));
  n_tra = [n_tra; exp(-alfa*d/1000)];
endfor
#mesh(d, w, n_tra);
#axis([0 100 0 100000 0 1]);
#xlabel('Distancia [m]');
#ylabel('Comprimento de onda [nm]');
#zlabel('Eficiencia [%]');

a_l = p_l/dp;
r = (a_l/pi)**0.5;

ee = n_tra * 0.5 * p_l;

figure(1);
plot(d, ee);
figure(2);
plot(d, n_tra);
grid;

