[eco, fs] = audioread('eco.wav');

atraso = 0.2*fs;
y = zeros(1, length(eco));

for i=1:length(eco)
  temp = i-atraso;
  if (temp > 0)
    y(i) = eco(i) - 0.7*y(temp);
  endif
endfor

t1 = 0:1/length(eco):1;
t2 = 0:1/length(y):1;
plot(t1, [0; eco], t2, [0; y']);

audiowrite('result.wav', y, fs);