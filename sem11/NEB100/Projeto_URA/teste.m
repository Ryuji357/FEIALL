#close all;
clear;
clc;

#f = 100;
fs = 8000;
t = 0:1/fs:0.3;

freq = 0:10:8000;
cont = 1;
for f=freq
  sinal = sin(2*pi*f.*t);

  result = filtro_detecta_faixa(sinal, 500, 400, fs, 0);
  y = conv(sinal, result);

  H(cont) = max(y);
  cont = cont + 1;
endfor

freqz(filtro_detecta_faixa(f, 900, 0, fs, 0), 1, 512, fs);

#figure(1);
#plot(freq, H);

#figure(1);
#subplot(2, 1, 1);
#plot(sinal);

#subplot(2, 1, 2);
#plot(y);