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
% [p, t] = pret_nrz(Tb, k, fs);
% plot(t, p); grid;

t_f = Tb*k;

t = [-t_f:1/fs:t_f]; % Retorno t

pout = zeros(1, 2*t_f*fs + 1);
pout(t>=(-Tb/2) & t<=(Tb/2)) = 1;

endfunction