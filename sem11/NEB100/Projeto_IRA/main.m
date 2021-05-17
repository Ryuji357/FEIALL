clear;
clc;

# DTMF
sinal = dtmf_gen(3);


stem(0:1/length(sinal):8000, abs(fft(sinal)), '.');
length(fft(sinal))