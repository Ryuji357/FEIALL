% Aula02_ex2
clc
clear

f0 = 500; % Frequencia do sinal [Hz]
tmax = 1e-2; % Tempo máximo de observação [s]
fs = 33e3; % Frequencia de amostragem (2*f por Nyquist) [Hz]
nbits=5; % Numero de bits


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