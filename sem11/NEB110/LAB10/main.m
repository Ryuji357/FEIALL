clear;
clc;

# Importação dos dados, variavel 'x'
covid_casos_novos_brasil;

y = filter(x, 7, 1);

figure(1);
hold on;
stem(x, '.');
#plot(x);
plot(y);