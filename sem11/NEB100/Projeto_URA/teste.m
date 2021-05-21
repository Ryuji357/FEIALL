#close all;
clear;
clc;

#f = 100;
fs = 8000;
t = 0:1/fs:0.3;

freq = 0:10:8000;

#cont = 1;
#for f = freq,
#  sinal = sin(f*2*pi.*t);
#  result(cont) = filtro_detecta_faixa(sinal, 500, 1000, 400, fs, 0.1);
#  cont = cont + 1;
#endfor

f = 1477;
sinal = sin(f*2*pi.*t);
filtro_detecta_faixa(sinal, 1300, 1400, 50, fs, 0.1)

#plot(freq, result);

#figure(1);
#plot(freq, H);

#figure(1);
#subplot(2, 1, 1);
#plot(sinal);

#subplot(2, 1, 2);
#plot(y);