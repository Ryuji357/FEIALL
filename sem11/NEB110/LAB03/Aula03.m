clear
clc

% Variaveis
n = 1e3; % Numero de amostras
p = 0.05; % Potencia do ruido
vb1 = 1; % Tensão nivel 1
vb0 = 0; % Tensão nivel 0

% Indice
i = 0:n-1;

% Sinal
x = randn(n, 1);
x(x>=0)=1;
x(x<0)=0;

%Ruido
r = randn(n, 1);

% Sinal de saida
y = x+p^0.5*r;

% Sinal final
l = (vb1+vb0)/2; % Limiar de detecção
yd = y;
yd(y>=l)=1;
yd(y<l)=0;

% Taxa de error
e = sum(abs(yd-x))/n*100;
fprintf('Taxa de erro: %.2f%%\n', e);

% Plotagem
plot(i, x, i, r, i, y, i, yd);
legend('Sinal', 'Ruido', 'Sinal + ruido', 'final');