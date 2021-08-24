function [pout, t] = cosseno_levantado(Tb, r, k, fs)
% Pulso cosseno levantado (raised-cosine)
% [pout, t] = cosseno_levantado(Tb, r, k, fs)
% Tb: duracao do pulso em segundo
% r: fator de decaimento (roll-off)
% k: tamanho total de pout 2*k*Tb
% fs: frequencia de amostragem, Hz
% pout: amostras do pulso de duracao 2*k*Tb
% t: indices do tempo
%
% Exemplo:
% Tb = 1;  % Tb 1 segundo
% r = 0.5;  % fator de decaimento (0<=r<=1) 
% k = 5;  % duracao total de pout: 2*Tb*k = 10 segundos
% fs = 50;  % fs = 50 Hz
% [p, t] = pret_rz(Tb, 5, fs);
% plot(t, p); grid;

endfunction