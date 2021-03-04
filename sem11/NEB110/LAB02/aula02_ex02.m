% Aula02_ex2
clc
clear

f0 = 500; % Frequencia do sinal [Hz]
tmax = 1; % Tempo máximo de observação [s]
fs = 8e3; % Frequencia de amostragem (2*f por Nyquist) [Hz]
nbits=16; % Numero de bits


ts = 1/fs;
t = 0:ts:tmax;

x = sin(2*pi*f0*t);
L = 2^nbits; % Numero de niveis
vpp = max(x) - min(x);
delta = vpp/L;

xq = delta*round(x/delta);

plot(t, x);
hold on; % Mantem o plot anterior
stem(t, xq, '.');
hold off;

audiowrite('xquant.wav', xq, fs);

% Respostas 2.1:
% 8KHz -> 8001 amostras
% 4KHz -> 4001 amostras
% 1KHz -> 1001 amostras
% 900Hz -> 901 amostras
% 500Hz -> 501 amostras
% 100Hz -> 101 amostras

% Respostas 2.2:
% n = 16 -> 16*8.001= 128.016
% n = 8 -> 8*8.001= 64.008
% n = 4 -> 4*8.001= 32.004
% n = 2 -> 2*8.001= 16.002