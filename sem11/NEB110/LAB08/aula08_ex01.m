clear;
clc;

deltaf = 400; # Banda de transição [Hz]
f_s = 8e3; # Frequencia de amostragem [Hz]
f_c = 1e3; # Frequencia de corte [Hz]

h = passa_baixa(deltaf, f_c, f_s);

cont = 1;
freq = 0:10:7990;
for f = freq,
  n = 0:999;
  x = cos(2*pi*f*n/f_s);
  y = conv(x, h);
  H(cont) = 20*log10(max(abs(y(length(h)+1:end-length(h)))));
  cont = cont + 1;
endfor

figure(1);
plot(freq, H);
xlabel('frequencia [Hz]')
xlabel('|H| [dB]')

# Confirmação do resultado
H2 = 20*log10(abs(fft(h, cont)));
figure(2);
plot(0:f_s/length(H2):f_s-(f_s/length(H2)), H2);