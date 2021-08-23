
for i = [7:-1:0]
  a = floor(i/2);
  b = floor(a/2);
  f = (7-i)*240;
  im(1:1080,f+1:f+240,1)=mod(a, 2)*255; %define a quantidade de vermelho da primeira faixa
  im(1:1080,f+1:f+240,2)=mod(b, 2)*255; %define a quantidade de verde da primeira faixa
  im(1:1080,f+1:f+240,3)=mod(i, 2)*255; %define a quantidade de azul da primeira faixa
endfor

image(im);
imwrite (im,'imagem.jpg','jpg')