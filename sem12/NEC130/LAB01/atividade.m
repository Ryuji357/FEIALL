clear all
close all
clc

X = imread ('image.jpg'); %carrega a imagem em X

V = size(X,1); %quantidade de pixels na vertical
H = size(X,2);%quantidade de pixels na horizontal
%relação de aspecto. Valores comuns 16/9 = 0.7778 4/3 = 1.333, 16/10 = 1.6
RA = H/V;
%resolução total = pontos Horizontais x pontos verticais
%Ex: Imagem full HD - 1920 x 1080 pixels ~= 2Mpixels
Res = H*V;

colormap(gray(256)); %define uma variável map com o colormap definido
R = X(:,:,1); %separa o canal R na matriz R
G = X(:,:,2); %separa o canal G na matriz G
B = X(:,:,3); %separa o canal B na matriz B

subplot(1,3,1) %visualiza as três matrizes no mapa de cor definido
image(R)
title('canal R')
axis off;

subplot(1,3,2)
image(G)
title('canal G')
axis off;

subplot(1,3,3)
image(B)
title('canal B')
axis off;

%% A função colormap gera uma matriz de com cores, ao gerar uma figure relaciona
%com os numeros inteiros. Altera-lo gera esquemas de cores diferentes.

Y = 0.587*G + 0.299*R + 0.114*B; %calcula o valor da luminância em função de R,G,B
Cb = 128 + 0.564*(B-Y);%calcula o valor de Pb em função de R,G,B
Cr = 128 + 0.713*(R-Y);%calcula o valor de Pr em função de R,G,B
figure %abre uma nova imagem

colormap(gray(256));
subplot(1,3,1) %visualiza as três matrizes no mapa de cor definido
image(Y)
title('canal de luminância')
axis off;

subplot(1,3,2)
image(Cb)
title('canal de Cb')
axis off;

subplot(1,3,3)
image(Cr)
title('canal de Cr')
axis off;

