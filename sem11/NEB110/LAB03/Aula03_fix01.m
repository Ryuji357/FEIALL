clear
clc

% Variaveis
n = 1e3; % Numero de amostras
p = 0.05; % Potencia do ruido
passo = 0.001;

vb1 = 1; % Tensão nivel 1
vb0 = 0; % Tensão nivel 0
l = (vb1+vb0)/2; % Limiar de detecção

% Indice
i = 0:n-1;

% Sinal
x = randn(n, 1);
x(x>=0)=1;
x(x<0)=0;

%Ruido
r = randn(n, 1);

% loop
p = 0:passo:1;
e = [];
for pv=p,
  % Sinal de saida
  y = x+pv^0.5*r;

  % Sinal final
  yd = y;
  yd(y>=l)=1;
  yd(y<l)=0;

  % Taxa de erro
  e = [e sum(abs(yd-x))/n*100];
end
% Plotagem
plot(p, e);
legend('Erro');