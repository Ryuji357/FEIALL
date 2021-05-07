% limpa variavel/console
clear;
clc;

% Variaveis
f_0 = 500; # Frequencia do sinal [Hz]
f_s = 8e3; # Frequencia de amostragem [Hz]
n = 16; # Numero de periodos

% Calculo
t_max = n/f_0 - 1/f_s;
t = 0:1/f_s:t_max;
x = cos(2*pi*f_0*t);

% Plotagem
figure(1);
stem(t, x, '.');
title('x(t)');

X = fft(x);
N = length(x);
k = 0:N-1;
w = k*2*pi/N;
f = w*f_s/(2*pi);

% Plotagem
figure(2);

subplot(3, 1, 1);
stem(k, abs(X), '.');
title('|X(k)|');
axis tight;

subplot(3, 1, 2);
stem(w, abs(X), '.');
title('|X(w)|');
axis tight;

subplot(3, 1, 3);
stem(f, abs(X), '.');
title('|X(f)|');
axis tight;

ind = 1:N/2+1;
hold on;
stem(f(ind), abs(X(ind)), '.');
hold off;

% Atividade b)
delta_w = 2*pi/N
delta_f = f_s/N
