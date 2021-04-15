[x, fs]=audioread('audio.wav');

% Principal y[n] = x[n] + 0,5*x[n - fs*0.1]
atraso = 0.1;
atenuacao = 0.5;

y = conv(x, [1 zeros(1, atraso*fs) atenuacao]);

audiowrite('result_1.wav', y, fs);

% Opcional y[n] = x[n] + 0,5*x[n - fs*0.1] + 0,3*x[n - fs*0.2]

y2 = conv(x, [1 zeros(1, fs*0.1) 0.5 zeros(1, fs*0.1) 0.3]);

audiowrite('result_2.wav', y2, fs);