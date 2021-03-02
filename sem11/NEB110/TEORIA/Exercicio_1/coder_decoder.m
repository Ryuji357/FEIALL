% k1 = 12, k2 = 11, k3 = 21, k4 = 22
% 0 substituido por 9

m1 = [1 2 1 1 5 4 8 1 9];
m2 = [1 2 2 1 8 1 6 7 9];

n = 0:17; % Vetor de indice de tempo
x = [1 3 4 6 -3 9 3 7 1 -5 2 6 9 9 4 5 -4 2]; % sequencia de amostras na entrada

k1 = [m1 m2]; % Chave publica k1
k2 = [m1 m1]; % Chave publica k2
k3 = [m2 m1]; % Chave publica k3
k4 = [m2 m2]; % Chave publica k4

% CODER %

subplot(2, 5, 1);
stem(n, x); % Plot do sinal discreto x[n]
xlabel("Amostras do sinal x[n]");

xa1 = x + k1;
subplot(2, 5, 2);
stem(n, xa1); % Plot do sinal discreto xa[n]
xlabel("Amostras do sinal xa[n]");

xb1 = xa1./k2;
subplot(2, 5, 3);
stem(n, xb1); % Plot do sinal discreto xb[n]
xlabel("Amostras do sinal xb[n]");

xc1 = xb1 - k3;
subplot(2, 5, 4);
stem(n, xc1); % Plot do sinal discreto xc[n]
xlabel("Amostras do sinal xc[n]");

xd = xc1.*k4;
subplot(2, 5, 5);
stem(n, xd); % Plot do sinal discreto xd[n]
xlabel("Amostras do sinal xd[n]");

% DECODER %

subplot(2, 5, 10);
stem(n, xd); % Plot do sinal discreto xd[n]
xlabel("Amostras do sinal xd[n]");

xc2 = xd./k4;
subplot(2, 5, 9);
stem(n, xc2); % Plot do sinal discreto xc[n]
xlabel("Amostras do sinal xc[n]");

xb2 = xc2 + k3;
subplot(2, 5, 8);
stem(n, xb2); % Plot do sinal discreto xb[n]
xlabel("Amostras do sinal xb[n]");

xa2 = xb2.*k2;
subplot(2, 5, 7);
stem(n, xa2); % Plot do sinal discreto xa[n]
xlabel("Amostras do sinal xa[n]");

xf = xa2 - k1;
subplot(2, 5, 6);
stem(n, xf); % Plot do sinal discreto xa[n]
xlabel("Amostras do sinal x[n]");