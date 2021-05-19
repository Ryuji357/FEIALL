#close all;
clear;
clc;

f = 100;
fs = 8000;
t = 0:1/fs:0.3;

freq = 0:10:8000;
cont = 1;

sinal = sin(2*pi*f.*t);

result = filtro_detecta_faixa(sinal, 100, 400, fs, 0);
y = conv(sinal, result);

#figure(1);
#plot(freq, H);

figure(1);
subplot(2, 1, 1);
plot(sinal);

subplot(2, 1, 2);
plot(y);