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
% [p, t] = cosseno_levantado(Tb, r, k, fs);
% plot(t, p); grid;

if (r<0 || r>1)
  error ('O valor de decaimento <r> deve ser tal que 0<=r<=1');
endif

t_f = Tb*k;
t = [-t_f:1/fs:t_f];

%Rb = 2*Tb
%pout = sinc(pi*r.*t)*(cos(pi*r.*t)/())

pout = (sinc(t./Tb)).*cos(r*pi.*t/Tb)./(1-(2*r.*t/Tb).**2);
t_z = Tb/(2*r);
pout(t==t_z | t==-t_z) = (pi/4)*sinc((1/(2*r))/Tb);

endfunction