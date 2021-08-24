function [pout, t] = pret_nrz(Tb, k, fs)
% Pulso retangular non-return-to-zero
% [pout, t] = pret_nrz(Tb, k, fs)
% Tb: duracao do pulso em segundo
% k: tamanho total de pout 2*k*Tb
% fs: frequencia de amostragem, Hz
% pout: amostras do pulso de duracao 2*k*Tb
% t: indices do tempo
%
% Exemplo:
% Tb = 1;  % Tb 1 segundo
% k = 5;  % duracao total de pout: 2*Tb*k = 10 segundos
% fs = 50;  % fs = 50 Hz
% [p, t] = pret_nrz(Tb, 5, fs);
% plot(t, p); grid;

endfunction