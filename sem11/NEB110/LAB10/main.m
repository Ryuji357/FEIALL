clear;
clc;

# Importação dos dados, variavel 'x'
covid_casos_novos_brasil;

% Periodo
t = 7;
y1 = conv(x, ones(1, t)*(1/t));
y1 = y1(1:length(x));

t = 14;
y2 = conv(x, ones(1, t)*(1/t));
y2 = y2(1:length(x));

figure(1);
hold on;
stem(x, '.');
#plot(x);
plot(y1);
plot(y2);
title('Casos novos no Brasil e médias moveis em dias');
xlabel('Período de 25/02 a 16/05/2021');
ylabel('Numeros de casos novos no Brasil');