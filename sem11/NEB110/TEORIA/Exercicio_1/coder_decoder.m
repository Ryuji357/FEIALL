% k1 = 12, k2 = 11, k3 = 21, k4 = 22

n = 0:17 % Vetor de indice de tempo
x = [1 3 4 6 -3 9 3 7 1 -5 2 6 9 9 4 5 -4 2] % sequencia de amostras na entrada

subplot(2, 5, 1)
stem(n, x) % Plot do sinal discreto x[n]
xlabel("Amostras do sinal x[n]")

k1 = [1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9] % Chave publica k1
xa = x + k1
subplot(2, 5, 2)
stem(n, xa) % Plot do sinal discreto xa[n]

k2 = 
xb = xa./k2