clear;
clc;

deltaf = 200;
fc1 = 500;
fc2 = 4e3;
fs = 16e3;
h = passa_faixa(deltaf, fc1, fc2, fs);

figure(1);
freqz(h, 1, 1024, fs);

clear;

deltaf = 100;
fc1 = 3e3;
fc2 = 7e3;
fs = 20e3;
h = rejeita_faixa(deltaf, fc1, fc2, fs);

figure(2);
freqz(h, 1, 1024, fs);
