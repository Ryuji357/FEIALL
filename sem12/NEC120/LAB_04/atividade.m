% Reset variaveis
close all;
clear all;
clc;

% DFT cosseno levantado
%Parametros
Tb=1; % Periodo
fs=100/Tb; % Frequencia de amostragem
r = 0.5; % Fator de roll-off
k=10; % Tamanho do sinal sera 2*k*Tb

% Gera sinal
[pout, t] = cosseno_levantado(Tb, r, k, fs);

% Calculo DFT
H=fftshift(abs(fft(pout))); ; 
NFFT=numel(H); 
f=(0:NFFT-1)/NFFT*fs; 
f=f-fs/2; 

% Gera plot
figure('name', 'Cosseno levantado', 'NumberTitle', 'off');

subplot(121);
plot(t, pout);
title('Sinal');
grid on;
grid minor on;

subplot(122);
stem(f,H,'.');
xlim([-1.5 1.5]); 
title('DFT');
grid on;
grid minor on;

% DFT RZ
%Parametros
Tb=1; % Periodo
fs=100/Tb; % Frequencia de amostragem
k=10; % Tamanho do sinal sera 2*k*Tb

% Gera sinal
[pout, t] = pret_rz(Tb, k, fs);

% Calculo DFT
H=fftshift(abs(fft(pout))); 
NFFT=numel(H); 
f=(0:NFFT-1)/NFFT*fs; 
f=f-fs/2; 

% Gera plot
figure('name', 'Return to Zero', 'NumberTitle', 'off');

subplot(121);
plot(t, pout);
title('Sinal');
grid on;
grid minor on;

subplot(122);
stem(f,H,'.');
xlim([-1.5 1.5]); 
title('DFT');
grid on;
grid minor on;

% DFT RZ
%Parametros
Tb=1; % Periodo
fs=100/Tb; % Frequencia de amostragem
k=10; % Tamanho do sinal sera 2*k*Tb

% Gera sinal
[pout, t] = pret_nrz(Tb, k, fs);

% Calculo DFT
H=fftshift(abs(fft(pout))); 
NFFT=numel(H); 
f=(0:NFFT-1)/NFFT*fs; 
f=f-fs/2; 

% Gera plot
figure('name', 'Non Return to zero', 'NumberTitle', 'off');

subplot(121);
plot(t, pout);
title('Sinal');
grid on;
grid minor on;

subplot(122);
stem(f,H,'.');
xlim([-1.5 1.5]); 
title('DFT');
grid on;
grid minor on;