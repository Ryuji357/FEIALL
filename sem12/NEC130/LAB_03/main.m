clear all
close all
clc
 
im = double(imread('imagem.jpg')); %troque para a sua figura 
imshow(uint8(im)) %exibe a figura colorida 
 
R = im(:,:,1); %canal de vermelho 
G = im(:,:,2); %canal de verde 
B = im(:,:,3); %canal de azul 
Y = 0.587*G+0.299*R+0.114*B; %imagem preto e branco 

%% Luminancia
figure;imshow(uint8(Y)) 
colormap(gray(256)) 
title('luminancia') 
 
%% encontra uma matriz binaria da imagem(0 ou 255)  
limiar = 50; %configure o limiar para verificar o efeito 
Bin = zeros (size(Y,1),size(Y,2)); 
Bin(Y>limiar)=255; 
Bin(Y<=limiar)=0; 
figure; imshow(uint8(Bin)) 
title('imagem binaria') 
 
%% aplica o filtro do tipo Sobel 
sobelx = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; %mascara de Sobel em x 
sobely = [1, 2, 1; 0, 0, 0; -1, -2, -1];%mascara de Sobel em y 
% aplicando o calculo do gradiente bi-dimensional 
rx = conv2(Bin,sobelx); 
ry = conv2(Bin,sobely); 
% absoluto  
gxy = sqrt(rx.^2 + ry.^2); 
figure; imshow(uint8(gxy)); 
title('contorno da imagem')

%Filtro passa-baixa
N = 3;
h = (1/N^2)*ones(N, N);
% Convolução
cR = conv2(R, h);
cG = conv2(G, h);
cB = conv2(B, h);
%Remontando
im_fpb(:,:,1) = cR;
im_fpb(:,:,2) = cG;
im_fpb(:,:,3) = cB;
figure;
imshow(uint8(im_fpb));
title('Filtro Passa-Baixa');

%Filtro passa-alta
N = 3;
h = (-1/N^2)*ones(N, N);
i = ceil(N/2);
h(i, i) = N^2-1;
% Convolução
cR = conv2(R, h);
cG = conv2(G, h);
cB = conv2(B, h);
%Remontando
im_fpa(:,:,1) = cR;
im_fpa(:,:,2) = cG;
im_fpa(:,:,3) = cB;
figure;
imshow(uint8(im_fpa));
title('Filtro Passa-Baixa');