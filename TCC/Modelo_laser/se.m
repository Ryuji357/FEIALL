clear;
clc;

i_max = 0.54;
i_th = 0.12;
v = 2.1;
i_se = 1.2;

n = 100;

i = 0:i_max/n:i_max;
i_drive = i - i_th;
i_drive(i_drive<0) = 0;
p = i_drive*i_se;
e = p./(i*v);

figure(1);
plot(i, p);
title("Potencia de saida");
grid;
grid minor;
xlabel('Corrente')
ylabel('Potencia')

figure(2);
plot(i, e);
title("Eficiencia");
grid;
grid minor;
xlabel('Corrente')
ylabel('Eficiencia')