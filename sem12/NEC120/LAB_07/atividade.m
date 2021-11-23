close all;
clear;
clc;

pkg load signal;

%Np = 10;  % numero de pulsos

data = [-1 -1 1 1 1 -1 -1 1 -1 -1 1 -1 1 1 1 -1 1 1 1 1];
Np = numel(data);

%data = round(round(rand(1, Np))-0.5);
fs = 10e3;  % freq amostragem em Hz
Tb = 10e-3;  % tempo de bit em segundo
k = 4;  % duracao do pulso gerado: 2*k*Tb
Nb = fs*Tb;  % amostras por pulso


dataup = upsample(data, Nb);  % trem de impulsos a cada Nb amostras

[prz, t_] = pret_rz(Tb, k, fs);
txrz = conv(prz, dataup);  % gera Np pulsos return-to-zero
t1 = (0:(numel(txrz)-1))/fs;

figure;
sp1 = subplot(2, 1, 1);
p1 = plot(t1, txrz);
title(sprintf('pulsos transmitidos, T_b = %g s (Return Zero)', Tb)); grid;
% note que 1 milhao de bits podem ser obtidos por
% data = sign(randn(1, 1e6));

r = 0.5; % Roll-off da função cosseno
[cl, t_] = cosseno_levantado(Tb, r, k, fs);
txcl = conv(cl, dataup);  % gera Np pulsos return-to-zero
t2 = (0:(numel(txcl)-1))/fs;

sp2 = subplot(2, 1, 2);
plot(t2, txcl);
title(sprintf('pulsos transmitidos, T_b = %g s (Cosseno)', Tb)); grid;

linkaxes([sp1, sp2], 'xy');

figure;
plot(t1, txrz);
hold;
plot(t2, txcl);
title('Sinais sobrepostos.')