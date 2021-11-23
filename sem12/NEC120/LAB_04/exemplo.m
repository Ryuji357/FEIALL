% Tb: duracao do pulso, em segundos (Rb = 1/Tb, taxa de transm, em Hz) 
% r: fator de decaimento (roll-off) 
% k: tamanho do sinal sera 2*k*Tb 
% fs: frequencia de amostragem 
% pout: pulso 
% t: indices de tempo 
% 
Tb=1; 
fs=100/Tb; 
r = input('Entre com o valor de r (roll-off): '); 
k=10; 
[pout, t] = cosseno_levantado(Tb, r, k, fs); 
figure(1), subplot(211), stem(t, pout, '.'); 
axis([-4 4 -.5 1.1]); 
ylabel('p(t)'); 
title(['pulso cosseno levantado, r=' num2str(r)]); 
subplot(212), plot(t, pout); xlabel('t, s'); 
axis([-4 4 -.5 1.1]); 
ylabel('p(t)'); 
figure(2), 
H=fftshift(abs(fft(pout))); 
NFFT=numel(H); 
f=(0:NFFT-1)/NFFT*fs; 
f=f-fs/2; 
stem(f,H,'.'); grid 
xlim([-1.5 1.5]); 
xlabel('f, Hz'); ylabel('|P(f)|'); 
title(['pulso cos lev , Tb =' num2str(Tb) ', r =' num2str(r)]); 
[pout0, t] = cosseno_levantado(Tb, 0, k, fs); 
[pout1, t] = cosseno_levantado(Tb, 1, k, fs); 
figure(3), plot(t, pout0, t, pout, t, pout1); 
title('pulsos cosseno levantado'); 
legend('r=0', ['r=' num2str(r)], 'r=1'); grid; xlabel('t, s');