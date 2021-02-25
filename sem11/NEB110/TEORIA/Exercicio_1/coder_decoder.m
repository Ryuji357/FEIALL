% k1 = 12, k2 = 11, k3 = 21, k4 = 22

m1 = [1 2 1 1 5 4 8 1 9]
m2 = 

n = 0:17 % Vetor de indice de tempo
x = [1 3 4 6 -3 9 3 7 1 -5 2 6 9 9 4 5 -4 2] % sequencia de amostras na entrada

k1 = [m1 m2] % Chave publica k1
k2 = [m1 m1] % Chave publica k2
k3 = [m2 m1] % Chave publica k3
k4 = [m2 m2] % Chave publica k4

subplot(2, 5, 1)
stem(n, x) % Plot do sinal discreto x[n]
xlabel("Amostras do sinal x[n]")


xa = x + k1
subplot(2, 5, 2)
stem(n, xa) % Plot do sinal discreto xa[n]

xb = xa./k2