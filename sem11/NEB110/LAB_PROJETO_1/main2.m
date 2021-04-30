quantidade = 5
n = 1
k = 1

[eco, fs] = audioread('eco.wav');
y = eco;

atraso = 0.2*fs

h = [];
for i=0:quantidade
  h = [h zeros(1, atraso*i) 0.7*((-1)^i)];
endfor

y = conv(y, h);

t1 = 0:1/length(eco):1;
t2 = 0:1/length(y):1;
plot(t1, [0; eco], t2, [0; y']);
%plot(t1, [0; eco]);

audiowrite('result.wav', y, fs);