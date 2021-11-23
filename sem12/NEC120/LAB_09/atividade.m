close all;
clear;
clc;

pkg load signal;

Np = 1e5;  % numero de pulsos

%data = [-1 -1 1 1 1 -1 -1 1 -1 -1 1 -1 1 1 1 -1 1 1 1 1];
%Np = numel(data);
%en_db = 15; % Ruido em db

data = round(round(rand(1, Np))-0.5);
fs = 10e3;  % freq amostragem em Hz
Tb = 10e-3;  % tempo de bit em segundo
k = 4;  % duracao do pulso gerado: 2*k*Tb
Nb = fs*Tb;  % amostras por pulso


dataup = upsample(data, Nb);  % trem de impulsos a cada Nb amostras


[pnrz, t_] = pret_nrz(Tb, k, fs);
txnrz = conv(pnrz, dataup);  % gera Np pulsos non-return-to-zero
l_c = (length(pnrz)-1)/2;
t_rx = [l_c:fs*Tb:length(txnrz)-l_c-fs*Tb];

en_db = [10, 5, 0, -5, -10];
pe = [];
pe_t = [];

Es = txnrz*txnrz'/length(txnrz); % Calculo terico
for x = [10, 5, 0, -5, -10]
  rx = round(snr(txnrz, x)(t_rx));
  rx(rx<0) = -1;
  rx(rx>=0) = 1;
  Ne = sum(0.5*abs(data - rx));
  pe = [pe Ne/Np];

  sigma_n = sqrt(Es*10^(-x/10)); % Calculo terico
  pe_t = [pe_t 1/2*erfc(1/sigma_n)];
endfor

% Teorico



figure;
plot(en_db, pe);
hold;
plot(en_db, pe_t);
legend ('Pe', 'Q(A_p/sigma_n)');
title(sprintf('Pe calculada com %g pulsos non-return-to-zero', Np));
xlabel('SNR');
xlabel('BER');
grid;

%{
[prz, t_] = pret_rz(Tb, k, fs);
txrz = conv(prz, dataup);  % gera Np pulsos return-to-zero
t1 = (0:(numel(txrz)-1))/fs;

[pnrz, t_] = pret_nrz(Tb, k, fs);
txnrz = conv(pnrz, dataup);  % gera Np pulsos non-return-to-zero
t2 = (0:(numel(txnrz)-1))/fs;

r = 0.5; % Roll-off da função cosseno
[cl, t_] = cosseno_levantado(Tb, r, k, fs);
txcl = conv(cl, dataup);  % gera Np pulsos return-to-zero
t3 = (0:(numel(txcl)-1))/fs;
%}

%{
figure('name', sprintf('Ruido de %g dB', en_db));

sp1 = subplot(3, 1, 1);
plot(t1, snr(txrz, en_db));
hold;
plot(t1, txrz);
ylim([-1.5, 1.5]);
title(sprintf('pulsos transmitidos, T_b = %g s (Return Zero)', Tb)); grid;

sp2 = subplot(3, 1, 2);
plot(t2, snr(txnrz, en_db));
hold;
plot(t2, txnrz);
ylim([-1.5, 1.5]);
title(sprintf('pulsos transmitidos, T_b = %g s (Non Return Zero)', Tb)); grid;

sp3 = subplot(3, 1, 3);
plot(t3, snr(txcl, en_db));
hold;
plot(t3, txcl);
ylim([-2, 2]);
title(sprintf('pulsos transmitidos, T_b = %g s (Cosseno)', Tb)); grid;

linkaxes([sp1, sp2, sp3], 'x');
%}