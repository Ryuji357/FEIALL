d = [4 0 0 2 8 9 2 2];

lista = [1 3
1 1
2 1
3 1
1 2
2 2
3 2
1 3
2 3
3 3];

fg = [1209 1336 1477 1633];
fb = [697 770 852 941];

fs = 8000;
t = 0:1/fs:0.2;
c = 0:length(t);

audio = []
for i=1:8
  temp = sin(2*pi*fb(lista(d(i)+1, 1)).*t) + sin(2*pi*fg(lista(d(i)+1, 2)).*t);
  audio = [audio temp zeros(1, fs*0.2)];
endfor

audiowrite('result.wav', audio, fs);